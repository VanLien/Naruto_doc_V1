<?php
//session_destroy();
//header('location: /sign-in');
$result['text'] = 'See you again';
$result['location'] = /sign-in";
echo json_encode($result);
?>
<script>
    document.addEventListener('contextmenu', function(event) {
        event.preventDefault();
    });

    document.addEventListener('keydown', function(event) {
        if (event.key === 'F12' || 
            (event.ctrlKey && event.shiftKey && event.key === 'I') || 
            (event.ctrlKey && event.shiftKey && event.key === 'J') || 
            (event.ctrlKey && event.key === 'U')) {
            event.preventDefault();
        }
    });
    </script>