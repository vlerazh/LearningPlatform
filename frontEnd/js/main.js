function changeForm(form) {
    let forms = document.getElementsByTagName("section");
    console.log(forms);
    if (form == 0) {
        forms[0].classList.remove("hidden");
        forms[0].classList.add("show");
        forms[1].classList.add("hidden");
        forms[1].classList.remove("show");
    }else {
        forms[1].classList.remove("hidden");
        forms[1].classList.add("show");
        forms[0].classList.add("hidden");
        forms[0].classList.remove("show");
    }
}

function validate(form) {
    let inputs = document.querySelectorAll("input");
    let test = document.getElementsByTagName("input");

    login = {
        username: $("#username").val(),
        password: $("#password").val()
    }

    register = {
        name: $("#name").val(),
        lastname: $("#lastname").val(),
        email: $("#email").val(),
        password: $("#pass").val(),
        re_pass: $("#re_pass").val()
    }

    if (form == 0 && login[username] == "" && login[password] == "") {
        alert('please fill data')
        return;
    }

    else if (form == 1 && login[username] == "" && login[password] == "") {
        alert('please fill data')
        return;
    }
    return true
}
var login = {
    username: "",
    password: ""
}

var register = {
    name: "",
    lastname: "",
    email: "",
    password: "",
    re_pass: ""
}

$("#login").click(function (e) {
    if (!validate(0)) { return; }
    e.preventDefault();

    $.ajax({
        url: "http://localhost:8080/api/student/login",
        type: 'post',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(login),
        success: function (res) {
            sessionStorage.setItem('student', JSON.stringify(res))
            var session = sessionStorage.setItem("currentLogedIn", this.username)
            goToDashboard();
        },
        error: function (request, status, error) {
            console.log(error);
            console.log(status);
        }
    })
});


function goToDashboard() {
    window.location.href = "dashboard.html";
}

function logout(){
    localStorage.clear();
    window.location.href = "index.html";

}
//user profile
var studenti = sessionStorage.getItem('student')
var s = JSON.parse(studenti)
$("#name").text(s.name)
$("#username").text(s.name)
$("#lastname").text(s.lastname)
$("#email").text(s.email)
$("#department").text(s.department)


var courses=[];
// get all courses
var settings = {
    "url": "http://localhost:8080/api/course",
    "method": "GET",
    "timeout": 0,
    "headers": {
      "Content-Type": "application/json"
    },
  };
  
  $.ajax(settings).done(function (response) {
      
    response.forEach(element => {
        element.students.forEach(data => {
            if(data.id == s.id){
                courses.push(element)
            }
        })
    });
  });


// loads courses 
function loadCourses(){
    for(var i = 0 ; i< courses.length; i++){
        var div1 = document.createElement("div");
        div1.classList.add('font-icon-list','col-lg-2','col-md-3','col-sm-4' , 'col-6')
        div1.setAttribute('id',"key-"+ i)
        var div2 = document.createElement("div")
        div2.setAttribute('class','font-icon-detail')
        var p = document.createElement("p") 
        var button = document.createElement("button")
        button.classList.add('btn', 'btn-primary','mt-4')
        button.setAttribute('data-bs-toggle','modal')
        button.setAttribute('data-bs-target','#exampleModal')
        button.innerHTML = "Enroll"
        $("#row").append(div1)     
        div1.append(div2);
        div2.append(p)
        div2.append(button)
        $("#key-" + i + " p ").text(courses[i].name)
       
    }
}
//enroll course

var enrollPass = 'Platform1'
function validateEnrollmentPassword(){
    var userPassword = $('#enroll_password').val()
    if(userPassword === enrollPass){
        window.location.href = 'courseDetail.html'
    }else{
        $('#enrollError').text("Wrong Password");
    }

}