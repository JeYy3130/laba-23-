

document.addEventListener("DOMContentLoaded", () => {
    let main = document.getElementById('main_block')
    let grd = document.getElementById('anouncements')
    let hg = document.getElementById("header_grid")

    let load_bth = document.getElementById('load')

    load_bth.addEventListener("click", () => {
        fetch('ann.php?page=' + grd.childElementCount).then(resp => resp.text()).then(res => {

            grd.insertAdjacentHTML('beforeend', res)
        })
    })


    fetch('ann.php?page=0')
        .then(resp => resp.text())
        .then(res => {
            grd.insertAdjacentHTML('beforeend', res)
        })


    let sign_in_button = document.getElementById('sign_in')


    sign_in_button.addEventListener("click", async () => {

        fetch('modal_signin.php').then(response => response.text()).then(value => {
            let md = new DOMParser().parseFromString(value, "text/html").getElementById('bg')
            document.getElementById('body').insertAdjacentElement('afterbegin', md)
            window.addEventListener('click', e => {
                if (!document.getElementById('sign_window').contains(e.target)) { //если клик вне элемента
                    md.remove()
                }
            });
        })



        // let btn = document.getElementById('btn')
        //
        // let formData = new FormData(document.getElementById('sign_window'))
        //
        // btn.addEventListener('submit', () => {
        //     let response = fetch('submitForm/enterForm.php', {
        //         method: 'POST',
        //         body: formData
        //     });
        //     if (response.ok) {
        //         let result = response.json();
        //         if (result) {
        //             alert('Успешно');
        //
        //         } else {
        //             alert('Неверный логин или пароль');
        //         }
        //     } else {
        //         alert('Ошибка');
        //     }
        //
        // })



    })
    let sign_out_button = document.getElementById('sign_out')
    sign_out_button.addEventListener("click", () => {
        fetch('modal_signout.php').then(response => response.text()).then(value => {
            let md = new DOMParser().parseFromString(value, "text/html").getElementById('bg')
            document.getElementById('body').insertAdjacentElement('afterbegin', md)
            window.addEventListener('click', e => {
                if (!document.getElementById('sign_window').contains(e.target)) { //если клик вне элемента
                    md.remove()
                }
            });
        })
    })
})
