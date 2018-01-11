$('#MyModal').modal({
    backdrop: 'static',
    keyboard: false
});

var request;  
function sendInfo()  
{  
var Name=createcontact.name.value;
var Phn1=createcontact.number1.value;
var Phn2=createcontact.number2.value;
var Email=createcontact.email.value;
var Company=createcontact.company.value;
//console.log("name:"+Name);
//document.getElementById('users').innerHTML=Name; 
var url="Name.jsp?name="+Name; 
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
var val;
function getInfo(){  
if(request.readyState==4){  
 val=request.responseText;  
document.getElementById('users').innerHTML=val; 
console.log("val"+val);
}  
}	

$(document).ready(function () {
   $("#addbtn").click(function(event){
       event.preventDefault();
       $.ajax({
           url: "Name.jsp",
           type:"GET",
           data:
           {
            'name': $('#name').val(),
           }
           });
        });
   });




