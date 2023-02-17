window.addEventListener('message', function (event) {
    var nui = event.data;
    if (nui.action == 'into') {
        moneys = nui.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        var money = document.querySelector('#money').innerHTML = moneys
        banks = nui.bank.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        var bank = document.querySelector('#bank').innerHTML = banks
        var job = document.querySelector('#job').innerHTML = `고유번호 : ${nui.user_id}  번 `
    }
});