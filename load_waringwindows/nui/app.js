window.addEventListener('message', function (event) {
    var nui = event.data;
    if (nui.type == 'stopwindows') {
        if (nui.reason == '핵') {
            $("#reasom").text('부정행위/불법 프로그램 사용')
        } else if (nui.reason == '규칙') {
            $("#reason").text('서버 규칙 위반')
        } else (
            $("#reason").text(nui.reason)
        )
        // $("#reason").text(nui.reason)
        // }
        $("#name").text(nui.name);
    }

    if(nui.type == 'open') {
        document.querySelector('#StopGame').style.display = 'block';
    }
});

$(document).ready(function(){
    $(".Btn").click(function(){
        document.querySelector('#StopGame').style.display = 'none';
        $.post("https://load_waringwindows/close_windows");
    });
});