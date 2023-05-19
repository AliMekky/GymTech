const express = require('express');
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const bcrypt = require('bcryptjs');
var user_info
// First, we start by creating a connection to the database
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: null,
    database: "GYMTECH",
    multipleStatements: true

});

con.connect(function (err) {
    if (err) throw err;
    console.log("SQL Connected!");
});


const PORT = process.env.PORT || 5000;
app.use(bodyParser.json({ limit: "100mb" }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.urlencoded());
app.use(cors({
credentials: true,
origin: ['http://localhost:8081']
}));
        
        

const server = app.listen(PORT, () => {
    console.log("Server is running on port", server.address().port);
});



app.post("/signup", async (req, res) => { // receive form data from signup
    const salt = await bcrypt.genSalt(10);
    const hashedpassword = await bcrypt.hash(req.body.password, salt);
    fname = req.body.fname;
    lname = req.body.lname;
    email = req.body.email;
    password = hashedpassword;
    gender = req.body.gender;
    age = req.body.age;
    height = req.body.height;
    weight = req.body.weight;
        
    // check if email exists in database, if it does, send to frontend: "Email exists"
    q_select = 'SELECT COUNT(email) FROM USER WHERE USER.email = ' + mysql.escape(email) + ';';
    con.query(q_select, function (err, result) {
    if (err) throw err;
    let count = result[0]['COUNT(email)'];
    console.log("call signup")
    if (count > 0) {
      res.send("Email exists");
      console.log("EMAIL ALREADY EXISTS! Returned message to frontend.")
    }
    else {
      res.send("Success");
      // insert new user in database 
      var target_weight = 0;
      var suggested_calories = 0;
      var daily_calories_burnt = 0;
      if(gender == 'M'){
        suggested_calories = weight*24*0.9; //neglecting the lean factor thet depends on the body weight and multiply by a constant 0.9
        if(height < 160)
          target_weight = height - 100;
        else
          target_weight = (height-100)*0.9;  
      }
      else{
        suggested_calories = weight*0.9*24*0.9
        if(height < 150)
          target_weight = height - 100;
        else 
          target_weight = (height-100)*0.9;  
      }

      q_insert = 'INSERT INTO USER(fname, lname, email, password, gender, age, height, weight, target_weight, suggested_calories_per_day, daily_calories_burnt) VALUES ('
        + mysql.escape(fname) + ', ' + mysql.escape(lname) + ', '
        + mysql.escape(email) + ', ' + mysql.escape(password) + ', '
        + mysql.escape(gender) + ', ' + mysql.escape(age) + ', ' + mysql.escape(height) + ', ' + mysql.escape(weight) + ', ' + mysql.escape(target_weight) + ', ' + mysql.escape(suggested_calories) + ', ' + mysql.escape(daily_calories_burnt) +');'
    
      con.query(q_insert, function (err, result) {
        if (err) throw err;
      });
    }
    });
    });

app.post("/signin", async (req, res) => { // receive form data from signup
  email = req.body.email;
  password = req.body.password;
  
  // check if combination of email and password exists in database
  q_select = 'SELECT COUNT(*), fname, lname, password FROM USER WHERE USER.email = ' + mysql.escape(email) + ';';
  con.query(q_select, async function (err, result) {
  if (err) throw err;
  let count = result[0]['COUNT(*)'];
  let fname = result[0]['fname'];
  let lname = result[0]['lname'];
  let password = result[0]['password'];
  if (count != 1) {
    console.log("Wrong email or password! Returned message to frontend.");
    res.send({ success: false, message: 'Wrong email or password', fname: null, lname: null });
  }
  else {
    if (! await bcrypt.compare(req.body.password, password)) {
      console.log("Wrong email or password! Returned message to frontend.");
      res.send({ success: false, message: 'Wrong email or password', fname: null, lname: null });
    } else {
      console.log("Signed in!");
      // const token = jwt.sign({ email: email }, "secret");
      // //console.log(token);
      // res.cookie('jwt', token, {
      //   httpOnly: true,
      //   maxAge: 24 * 60 * 60 * 1000
      // });
      res.send({ success: true, message: 'Signed in', fname: fname, lname: lname });
    }
  
  }
  });
  });

app.post("/addExercise", (req, res) => {
  exercise_name = req.body.exercise_name;
  calories_per_set = req.body.calories_per_set;
  category = req.body.category;
  target_muscle = req.body.target_muscle;
  image_url = req.body.image_url;
  video_url= req.body.video_url;
      // ADD EXERCISE TO EXERCISE TABLE
      q_insert_exercise = 'INSERT INTO EXERCISE(`name`, calories_per_set, category, target_muscle, video_link, image_url) VALUES ('
        + mysql.escape(exercise_name) + ', ' + mysql.escape(calories_per_set) + ', ' + mysql.escape(category) + ', '
        + mysql.escape(target_muscle) +  ', ' + mysql.escape(video_url) + ', '
        + mysql.escape(image_url) + ');';

      con.query(q_insert_exercise, function (err, result4) {
        if (err) throw err;
        res.send("Exercise added successfully")
      });
    });


app.post("/addGym", (req, res) => {
  gym_name = req.body.gym_name;
  price_per_month = req.body.price_per_month;
  location = req.body.location;
  working_hours = req.body.working_hours;
  gym_url = req.body.gym_url;
  rating= req.body.rating;

  q_insert_gym = 'INSERT INTO GYM (`name`,`location`, `price/month`, working_hours, rating, link) VALUES (' 
  + mysql.escape(gym_name) + ', ' + mysql.escape(location) + ', ' + mysql.escape(price_per_month) + ', ' + mysql.escape(working_hours)
  + ', ' + mysql.escape(rating) + ', ' + mysql.escape(gym_url) + ');';

  con.query(q_insert_gym, function (err, result4) {
    if (err) throw err;
    res.send("Gym added successfully")
  });
});

app.post("/feedback", (req, res) => {
  

  var feedback = req.body.feedback;
  email = req.body.user_email;
  var currentDate = new Date().toJSON().slice(0, 10);      
      

  q_select = 'SELECT user_id FROM USER WHERE USER.email = ' + mysql.escape(email) + ';';
    con.query(q_select, async function (err, result) {
    if (err) throw err;

    var id = result[0]['user_id'];
    q_insert_feedback = 'INSERT INTO  RECOMMENDATIONS (user_id,`date`, recommendation) VALUES (' 
    + mysql.escape(id) + ', ' + mysql.escape(currentDate) + ', ' + mysql.escape(feedback) + ');';

    con.query(q_insert_feedback, function (err, result4) {
      if (err) throw err;
      res.send({Success: true})
    });

    //var currentDate = new Date().toJSON().slice(0, 10);
  })
});

app.post("/addWorkout", async (req, res) => {
  //Add exrecise to db i sent an array of keys called keys & workout_name
  keys=req.body.keys;
  workout_name=req.body.workout_name;
  email=req.body.email;
  console.log(mysql.escape(keys));

  var result = await new Promise((resolve, reject) => {
    var q_get_calories_per_set = 'SELECT (calories_per_set*3) FROM EXERCISE WHERE ex_id IN (' + mysql.escape(keys) + ');';
    con.query(q_get_calories_per_set, function (err, result) {
      if (err) reject(err);
      resolve(result);
    });

  });
  var user_id = await new Promise((resolve, reject) => {
    var q_get_user_id = 'SELECT user_id FROM USER WHERE email = ' + mysql.escape(email) +';';
    con.query(q_get_user_id, function (err, user_id) {
      if (err) reject(err);
      resolve(user_id); 
    });
  });
  var calories = [];
  for(let i=0;i<result.length;i++){
    calories.push(result[i]['(calories_per_set*3)'])
  }
  console.log(user_id[0].user_id)
  console.log(calories)
  str = ''
  for(let i = 0;i < keys.length; i++) {
    str += `INSERT INTO WORKOUT (user_id, ex_id, workout_name, category, number_of_sets, total_calories) VALUES (` 
    + mysql.escape(user_id[0].user_id) + `, ` + mysql.escape(keys[i]) + `, ` + mysql.escape(workout_name) + `, NULL,  ` + `3, ` + mysql.escape(calories[i]) + `);`
  }
con.query(str, function(err, result) {
  if (err) throw err;
  res.send({Success: true})
})

  
  
});




  app.get("/getFeedbacks", (req, res) => {
    // date_from = req.body.date_from;
    // date_to = req.body.date_to;
  
  
    q_select_payments = 'SELECT fname, lname, recommendation, `date` FROM RECOMMENDATIONS JOIN USER ON RECOMMENDATIONS.user_id = USER.user_id';
    con.query(q_select_payments, function (err, result) {
      if (err) throw err;
      let columns = result;
      //columns.forEach(dateToString2);
      console.log(columns)
      res.send(columns);    
    });
  })

  app.get("/getGyms", (req, res) => {
    q_select_gym = 'SELECT `name`, `location` , `price/month`, working_hours, rating, link FROM GYM';
    con.query(q_select_gym, function (err, result) {
      if (err) throw err;
      let columns = result;
      //columns.forEach(dateToString2);
      console.log(columns)
      res.send(columns);    
    });

  })  

  app.get("/exercises", (req, res) => {
    q_select_gym = 'SELECT * FROM EXERCISE';
    con.query(q_select_gym, function (err, result) {
      if (err) throw err;
      let columns = result;
      //columns.forEach(dateToString2);
      //console.log(columns)
      res.send(columns);    
    });

  })

  
  
  

  app.post("/dashboardData", async (req, res) => {
    dashboard = {};
    
    email = req.body.email;
    console.log(email);
    frequencies = []
    var query = `SELECT user_id, fname, lname, email, weight, height, target_weight, daily_calories_burnt, gender, age, suggested_calories_per_day  FROM USER WHERE email = ${mysql.escape(email)};`;
    const user_info = await new Promise((resolve, reject) => {
      con.query(query, function (err, result) {
        if (err) reject(err);
        
        resolve(Object.values(JSON.parse(JSON.stringify(result))));
      });
    });
    //console.log(user_info);
    dashboard.user_info = user_info[0];
    

    var year = new Date().getFullYear()
    
    for(var i = 1;i<=12;i++){
      var temp = await new Promise((resolve, reject) => {
        query = 'SELECT COUNT(*) FROM PROGRESS JOIN USER ON PROGRESS.user_id=USER.user_id WHERE `date` LIKE  "' + mysql.escape(year)  + '_%' + mysql.escape(i) + '___" AND USER.user_id='  + mysql.escape(dashboard.user_info["user_id"])+ ';';
        con.query(query, function (err, result) {
          if (err) reject(err);
          resolve(result);
        });
      });
      //console.log(temp[0]['COUNT(*)']);
      frequencies.push(temp[0]['COUNT(*)'])
    }

    dashboard.frequencies = frequencies

    id = user_info[0]['user_id'];
    var result = await new Promise((resolve, reject) => {
      query = 'SELECT SUM(DAILY_WORKOUT.weight*DAILY_WORKOUT.reps), DAILY_WORKOUT.date, DAILY_WORKOUT.workout_name FROM (SELECT DISTINCT `date` FROM DAILY_WORKOUT WHERE user_id = ' + mysql.escape(id) + ' ORDER BY `date` DESC LIMIT 7) last_7_dates JOIN DAILY_WORKOUT ON DAILY_WORKOUT.date = last_7_dates.date WHERE DAILY_WORKOUT.user_id = ' + mysql.escape(id) + ' GROUP BY DAILY_WORKOUT.date, DAILY_WORKOUT.workout_name';
      con.query(query, function (err, result) {
        if (err) reject(err);
        resolve(result);
      });
    });
    let volumes=[]
    for(let i=0;i<result.length;i++){
      volumes.push(result[i]['SUM(DAILY_WORKOUT.weight*DAILY_WORKOUT.reps)'])
    }
    dashboard.volumes = volumes;

    console.log(volumes)
    var workouts = await new Promise((resolve, reject) => {
      query = query = 'SELECT DISTINCT workout_name FROM WORKOUT WHERE WORKOUT.user_id = ' + mysql.escape(id) + ';';
      con.query(query, function (err, result) {
        if (err) reject(err);
        resolve(result);
      });
    });
    workout_names = [];
    for(let i=0;i<workouts.length;i++){
      workout_names.push(workouts[i]['workout_name'])
    }

    //console.log(workout_names);
    dashboard.workouts = workout_names;
    
    
    
    //console.log(dashboard);
    res.send(dashboard);
  });
  


//   SELECT SUM(weight*reps)
// FROM DAILY_WORKOUT
// where `date` in (
// 	SELECT UNIQUE `date`
//     FROM DAILY_WORKOUT
// 	JOIN workout
// 	ON DAILY_WORKOUT.workout_id = workout.workout_id and DAILY_WORKOUT.ex_id = WORKOUT.ex_id
//     where user_id = 1
//     ORDER BY `date` DESC
//     LIMIT 7
// );

// SELECT SUM(DAILY_WORKOUT.weight*DAILY_WORKOUT.reps), DAILY_WORKOUT.date FROM ( SELECT DISTINCT `date` FROM DAILY_WORKOUT JOIN workout ON DAILY_WORKOUT.workout_id = workout.workout_id AND DAILY_WORKOUT.ex_id = WORKOUT.ex_id WHERE user_id = 1 ORDER BY `date` DESC LIMIT 7 ) last_7_dates JOIN DAILY_WORKOUT ON DAILY_WORKOUT.date = last_7_dates.date GROUP BY DAILY_WORKOUT.date;
app.post("/startWorkout", (req, res) => {
  
  email=req.body.email;
  workout_name=req.body.workout_name;
  query = 'SELECT WORKOUT.workout_name, EXERCISE.ex_id, EXERCISE.`name`, EXERCISE.image_url, WORKOUT.number_of_sets  FROM WORKOUT JOIN USER ON WORKOUT.user_id = USER.user_id JOIN EXERCISE ON WORKOUT.ex_id = EXERCISE.ex_id WHERE workout_name = ' + mysql.escape(workout_name) + ' AND email = ' + mysql.escape(email) + ';';
  con.query(query, function (err, result) {
    if (err) throw err;
    let columns = result;

    res.send(columns);    
  });
  
});

app.post("/finishWorkout",async (req,res)=>{
  workout=req.body.workout;
  date=req.body.date;
  email=req.body.email;
  workout_name=req.body.workout_name;
  //console.log(workout,date,email,workout_name)
  var result = await new Promise((resolve, reject) => {
    var q_get_user_id = 'SELECT user_id FROM USER WHERE email = ' + mysql.escape(email) +';';
    con.query(q_get_user_id, function (err, user_id) {
      if (err) reject(err);
      resolve(user_id); 
    });
  });
  
  user_id = result[0].user_id
  var str = '';
  for(let i = 0;i < workout.length; i++) {
    for(let j = 0;j<3;j++){
      str += `INSERT INTO DAILY_WORKOUT (workout_name, user_id, \`date\`, ex_id, set_number, weight, reps) VALUES (` 
    + mysql.escape(workout_name) + `, ` + mysql.escape(user_id) + `, ` + mysql.escape(date) + `, `+ mysql.escape(workout[i].ex_id) + `,  `+ mysql.escape(j+1) + `, ` + mysql.escape(workout[i].ex_weghts[j]) +  `, ` + mysql.escape(workout[i].ex_reps[j]) + `);`
    }
  }

  str += 'INSERT INTO PROGRESS(user_id, \`date\`, workout_name, trained) VALUES('+ mysql.escape(user_id) + `, ` + mysql.escape(date) + `, `  + mysql.escape(workout_name) + `, ` + mysql.escape(1) +`);`;
  //console.log(str);
  con.query(str, function(err, result) {
    if (err) throw err;
    res.send({Success: true})
  })

})