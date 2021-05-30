const pay = () => {
  Payjp.setPublicKey("pk_test_2fceebb845c0c129d558206f");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("ship_record[number]"),
      cvc: formData.get("ship_record[cvc]"),
      exp_month: formData.get("ship_record[exp_month]"),
      exp_year: `20${formData.get("ship_record[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);