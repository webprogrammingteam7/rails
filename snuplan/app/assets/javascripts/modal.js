        window.onload = function(){ 
    // your code 



        // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the button that opens the modal
        // 클래스 어레이로 여러 버튼 만들기
        var btn = document.getElementsByClassName("myBtn");
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 

        for(var i = 0; i <btn.length; i++) {
        btn[i].onclick = function() {
            modal.style.display = "block";
        } }
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
};