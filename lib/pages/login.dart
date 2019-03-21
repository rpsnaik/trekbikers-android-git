import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home.dart';
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference databaseusers = FirebaseDatabase.instance.reference().child('1/users');

  Future<bool> saveNamePreference(String emailSave, String passwordSave, String userid) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("emailid", emailSave);
    prefs.setString("userid", userid);
    prefs.setString("passwordid", passwordSave);
    return prefs.commit();
  }

  Future<bool> firstcomeState(bool b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstcomeState", b);
    return prefs.commit();
  }
  Future<bool> resfirstcomeState() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getBool("firstcomeState");
  }
  Future<String> getEmailSP() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString("emailid");
  }
  Future<String> getPasswordSP() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString("passwordid");
  }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool firststate = false;
  @override
  void getfirstcomeState(bool b){
     firststate = b;
     executeState();
  }
  void initState(){
    starterfun();
    super.initState();
  }
  void starterfun() async {
    await resfirstcomeState().then(getfirstcomeState);
  }
  void executeState(){
    print(firststate);
    if(firststate == true){
      //Signup //LoginScreen
      setState(() {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> LoginHome()));
      });
    }
    else{
      //Showcase //AfterSignup
      
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/starter1.jpg'),
                        fit: BoxFit.cover,
                      )
                    ),
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60.0,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print("forward");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Login1()));
                    },
                    child: Card(
                      elevation: 0.0,
                      color: Colors.red,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Get Started", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),),
                            Icon(Icons.chevron_right, size: 30.0,color: Colors.white),
                          ],
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),
          )
        )
      ),
      )
    );
  }
}


class Login1 extends StatefulWidget {
  @override
  _Login1State createState() => _Login1State();
}


class _Login1State extends State<Login1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/starter2.jpg'),
                        fit: BoxFit.cover,
                      )
                    ),
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60.0,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print("back");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Login()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.chevron_left, color: Colors.grey,size: 30.0,),
                        Text("Back", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print("forward");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Login2()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Next", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                        Icon(Icons.chevron_right, color: Colors.white,size: 30.0,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ),
      )
    );
  }
}

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}


class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/starter3.jpg'),
                        fit: BoxFit.cover,
                      )
                    ),
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60.0,
              color: Colors.blue,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print("back");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Login1()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.chevron_left, color: Colors.black,size: 30.0,),
                        Text("Back", style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print("forward");
                      firstcomeState(true);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> LoginHome()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Next", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                        Icon(Icons.chevron_right, color: Colors.white,size: 30.0,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ),
      )
    );
  }
}












class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {


   String emailid;
   String password;
   bool _validate = false;
   bool loginStateBool = false;
   bool firststate = false;
    @override
    void getfirstcomeState(bool b){
      firststate = b;
      executeState();
    }
  void initState() {
    starterfun();
    super.initState();
  }

  void executeState(){
    print(firststate);
    if(firststate == true){
      //Signup //LoginScreen
      checkuser1(emailid, password);
    }
    else{
      loginStateBool = true;
    }
  }

  void savePasswordSP(String pass){
    password =pass;
  }
  void saveEmailidSP(String email){
    emailid =email;
  }

   void starterfun() async {
    await getEmailSP().then(saveEmailidSP);
    await getPasswordSP().then(savePasswordSP);
    await resfirstcomeState().then(getfirstcomeState);
  }




  





                                  Future<void> checkuser(String emailid, String password) async{
                                    try{
                                      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid, password: password);
                                      saveNamePreference(emailid, password, user.uid);
                                      print("Success");
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Home(signinData: SigninData(user.uid),)));
                                      setState(() {
                                       signinbtnloader =false; 
                                      });
                                    }catch(e){
                                        setState(() {
                                         signinbtnloader =false; 
                                        });
                                        key.currentState.showSnackBar(SnackBar(
                                              content: new Text("Please Check your Network Connection... and Enter valid Email and Password"),
                                            ));
                                      print(e.message.toString());
                                      print("Unsuccessfull");
                                     
                                    }
                                    }

                                    Future<void> checkuser1(String emailid, String password) async{
                                    try{
                                      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid, password: password);
                                      saveNamePreference(emailid, password, user.uid);
                                      print("Success");
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Home(signinData: SigninData(user.uid),)));
                                    }catch(e){
                                        // key.currentState.showSnackBar(SnackBar(
                                        //       content: new Text("Please Check your Network Connection... and Enter valid Email and Password"),
                                        //     ));
                                      print(e.message.toString());
                                      print("Unsuccessfull while Startup");
                                       setState(() {
                                       loginStateBool = true; 
                                      });
                                    }
                                    }





  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }
  String validatePass(String value) {
    if (value.length == 0) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be of 6 charecters";
    }
    return null;
  }

  Widget loginScreen(){
    if(loginStateBool == true){
      return ListView(
        children: <Widget>[
          Container(
            height: 900.0,
            decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/auth_back.png'),
                        fit: BoxFit.cover,
                      )
                    ),
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height:50.0,
                ),
                Text("Signin with Your \nAccount", style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.greenAccent,
                ),),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/logo.png', fit: BoxFit.contain,scale: 5.0,),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Form(
                        key: _key,
                        autovalidate: _validate,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: new InputDecoration(labelText: 'Email ID',),
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 100,
                                validator: validateEmail,
                                onSaved: (email){
                                  emailid =email;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: new InputDecoration(labelText: 'Password',),
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                                obscureText: true,
                                validator: validatePass,
                                onSaved: (pass){
                                  password =pass;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              RaisedButton(
                                
                                color: Colors.blue,
                                onPressed:(){
                                  if(_key.currentState.validate()){
                                    setState(() {
                                     signinbtnloader = true; 
                                    });
                                    //print("Success");
                                    _key.currentState.save();
                                    //print("Email ID : "+emailid);
                                    //print("Password : "+password);
                
                                  
                                    
                                    checkuser(emailid, password);
                                  }
                                },
                                child: _signinbtn(),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text("Don't have an account ?"),
                                InkWell(
                                  onTap: (){
                                    print("Reg");
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SignUp()));
                                  },
                                  child: Text(" Register here", style: TextStyle(
                                    color: Colors.blue,
                                  ),),
                                )
                              ],),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text("Forgot Password ?"),
                                InkWell(
                                  onTap: (){
                                    print("Forgot Password");
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> forgotPass()));
                                  },
                                  child: Text(" Click me", style: TextStyle(
                                    color: Colors.blue,
                                  ),),
                                )
                              ],),
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                )
                
              ],
            ),
          ),
        ],
      );
    }
    else{
      return Container(
        padding: EdgeInsets.all(100.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png', fit: BoxFit.fitWidth,),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20.0,
            ),
            Text("Logging in..."),
          ],
        )
      );
    }
  }
  GlobalKey<FormState> _key = new GlobalKey();
  final key = new GlobalKey<ScaffoldState>();
  bool signinbtnloader = false;
  Widget _signinbtn(){
  if(signinbtnloader == true){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
        ],
      ),
    );
  }
  else{
    return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.verified_user, color: Colors.white,),
                                      Text(" Sign in", style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ],
                                  ),
                                );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: loginScreen(),
    );
  }
}


//Forgot Password
class forgotPass extends StatefulWidget {
  @override
  _forgotPassState createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  final key = new GlobalKey<ScaffoldState>();
  final emailReset = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: ListView(
      children: <Widget>[
        Container(
          height: 800.0,
          decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/auth_back.png'),
                        fit: BoxFit.cover,
                      )
                    ),
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Forgot Password...",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Find your account... Enter your E-Mail", style: TextStyle(fontSize: 15.0),),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  validator: emailCheck,
                  controller: emailReset,
                  decoration: InputDecoration(
                      labelText: 'E-Mail'
                  ),
                  
                ),

                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: forGotpass,
                  child: Text("Reset Password"),
                )
            ],
          ),
        )
      ],
    ),
    );
  }
  String emailCheck(String value){
                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    if (value.length == 0) {
                      return "Email is Required";
                    } else if(!regExp.hasMatch(value)){
                      return "Invalid Email";
                    }else {
                      return null;
                    }
                  
  }
  Future<void>forGotpass() async {
      String email;
      if(emailCheck(emailReset.text) == null){
        email = emailReset.text;
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
          key.currentState.showSnackBar(new SnackBar(
                content: new Text("We sent an Email to Reset your Password, Check your Inbox"),
          ));
        } catch (e) {
          print(e);
          key.currentState.showSnackBar(new SnackBar(
                content: new Text(e.toString()),
          ));
        }
      }
      else{
        print("In valid Email");
        key.currentState.showSnackBar(new SnackBar(
                content: new Text("Invalid Email ID"),
        ));
        
      }
}
}



//Signup
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String name, email, mobile, password;
  bool signupbtnloader = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
      backgroundColor: Colors.cyanAccent,
        body: new SingleChildScrollView(
          child: new Container(
            
            margin: new EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Text("New \nAccount", style: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('images/logo.png', fit:BoxFit.fitWidth, scale:5.0),
                Form(
                  key: _key,
                  autovalidate: _validate,
                  child: formUI(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Name'),
          maxLength: 32,
          validator: validateName,
          onSaved: (String val) {
            name = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(labelText: 'Mobile Number'),
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: validateMobile,
            onSaved: (String val) {
              mobile = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(labelText: 'Email ID'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            }),
            new TextFormField(
            decoration: new InputDecoration(labelText: 'Set a new Password'),
            validator: validatePass,
            maxLength: 32,
            obscureText: true,
            onSaved: (String val) {
              password = val;
            }),
        new SizedBox(height: 10.0),
        Text("By clicking Sign up, you agree to our Terms and Conditions and our Data Use Policy, You can read them here", style: TextStyle(
                      fontFamily: 'Nunitno',
                    ),textAlign: TextAlign.start,),
        SizedBox(
          height: 15.0,
        ),
        new RaisedButton(
              padding: EdgeInsets.all(10.0),
              color: Colors.brown,
              onPressed: signUpBtn,
              child: _signupbtn(),
            ),
        SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Already have an account ? "),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context) ;
                      },
                      child: Text("Sign in here", style: TextStyle(color: Colors.blue),),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text("Forgot Password ?"),
                                InkWell(
                                  onTap: (){
                                    print("Forgot Password");
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> forgotPass()));
                                  },
                                  child: Text(" Click me", style: TextStyle(
                                    color: Colors.blue,
                                  ),),
                                )
                              ],),
      ],
    );
  }



  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validatePass(String value) {
    if (value.length == 0) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be of 6 charecters";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }


  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  Widget _signupbtn(){
  if(signupbtnloader == true){
    return CircularProgressIndicator();
  }
  else{
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Sign up", style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
    ),)
        ],
      ),
    );
  }
}


  Future<void> signUpBtn() async {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Name $name");
      print("Mobile $mobile");
      print("Email $email");
      print("Password $password");
       Future<void>signupuser() async{
         try{
          FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          databaseusers.child(user.uid).set({
            'uid':user.uid,
            'name':name,
            'email':email,
            'mobile':mobile,
            'verified':false,
          });
          Navigator.pop(context);
        }catch(e){
                setState(() {
                  signupbtnloader = false; 
                });
          print(e.message);
        }
       }

      setState(() {
       signupbtnloader = true; 
       Future.delayed(Duration(seconds: 2), signupuser);
      });

    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}


