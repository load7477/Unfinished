// <!-- delivery Main Code -->

window.addEventListener('message', function (event) {
    var nui = event.data
    if (nui.action == "test") {
        document.querySelector('#DeliveryCall').style.display = 'block';
        setTimeout(() => $('div').remove(`.CallBox`), 000);
    }
    if (nui.call = 'true') {
        console.log('true')
        button(`${nui.id}`, `${nui.types}`, `${nui.price}`, `${nui.clientmsg}`, `${nui.x}`, `${nui.y}`, `${nui.z}`)
    }
    
});

// <!-- close delivery Code -->

$(document).ready(function(){
    $("#delivery-close").click(function(){
        // document.querySelector('#DeliveryCall').style.display = 'none';
        $.post("http://forcus_delivery/delivery_close", JSON.stringify({}));
        
    });
});

// <!-- delivery AddCall Code -->

function button(id, types, price, clientmsg, x, y, z) {
    v = [id, types, price, clientmsg, x, y, z]
    callbox = $('.CallMain').append(`
        <div class="CallBox" id = "${v[0]}">
            <div class="CallInfo">
                <div class="CallType">
                    <p>${v[4]}, ${v[5]}, ${v[6]}</p>
                </div>
                <div class="Price">
                    <p>${v[2]}</p>
                </div>
                <div class="ClientMsg">
                    <p>${v[3]}</p>
                </div>
            </div>
            <div class="CallBtn">
                <button onclick="sucess('${id}, ${x}, ${y}, ${z}')">수락</button>
            </div>
        </div>
    `);
}


// <!-- delivery sucess button code
 
function sucess(name, x, y, z) {
    setTimeout(() => $('div').remove(`#${name}`), 500);
    $.post("http://forcus_delivery/sucess", JSON.stringify({x:x, y:y, z:z}));
}