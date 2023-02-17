function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
window.addEventListener("keydown", (e) => {
    if (e.key == "Enter") {
        const value = document.querySelector('#pw').value
        $.post('http://zeus_doors/getserverpw', JSON.stringify({password: value}));
    }
});

window.addEventListener( 'message', function( event ) {
    var item = event.data;
	
    if (item.open) {
        document.querySelector('body').style.display = 'block';
    }

    if (item.result == 1) {
        console.log(item.result)
        document.querySelector('#login-s').style.display = 'block';
        sleep(50000)
        document.querySelector('#login-s').style.display = 'none';
        document.querySelector('body').style.display = 'none';
	} else if ( item.result == 2) {
        document.querySelector('#error').style.display = 'block';
        document.querySelector('#login-s').style.display = 'none';
    }
});
  