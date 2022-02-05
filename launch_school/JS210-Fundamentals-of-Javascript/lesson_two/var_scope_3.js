let basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }
  //this logs 'empty' because shop1() is not yet executed
  console.log(basket);

  let shop2 = function() {
    basket = 'computer';
  };

  const shop3 = () => {
    let basket = 'play station';
    console.log(basket);
  };
  //shop1() when executed reassigns basket to 'tv';
  //shop2() reassigns basket to 'computer'
  //shop() declares a new variable`basket` to `play station` and logs that valuel; this is variable
  //shadowing. It does not affect the variable `basket` in the outer scope.
  shop1();
  shop2();
  shop3();
  //since the `basket` variable has the value 'computer', it should log 'computer'
  console.log(basket);
}

goShopping();
