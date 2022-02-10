function dateSuffix(num) {
  const suff = {1: 'st', 2: 'nd', 3: 'rd'}
  let suffix = '';
  let lastDigit = num % 10;

  if ((num < 20 && num > 10) || !suff[lastDigit])  {
    suffix = 'th';
  } else {
      suffix = suff[lastDigit];
  }

  return String(num) + suffix;
}

function formattedDay(day) {
  const DAYS_OF_WEEK = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return DAYS_OF_WEEK[day];
}

function formattedMonth(num) {
  const MONTHS =
    [
      'Jan', 'Feb', 'Mar', 'April', 'May',
      'June', 'Jul', 'Aug', 'Sep', 'Oct',
      'Nov', 'Dec'
    ];

  return MONTHS[num];
}

function formattedDate(date) {
  let dateNum = date.getDate();
  let dayNum = date.getDay();
  let dayName = formattedDay(dayNum);
  let month = formattedMonth(date.getMonth());

  console.log(`Today's day is ${dayName}, ${month} ${dateSuffix(dateNum)}.`)
}

let today = new Date();

formattedDate(today);

console.log(today.getYear());
console.log(today.getFullYear());
console.log(today.getTime());

let tomorrow = new Date();
tomorrow.setDate(today.getDate() + 1);

formattedDate(tomorrow);

let nextWeek = new Date(today.getTime());

console.log(nextWeek === today);

console.log(nextWeek.toString === today.toString);

nextWeek.setDate(nextWeek.getDate() + 7);

formattedDate(nextWeek);

function formatTime(date) {
  let hour = date.getHours().toString();
  let mins = date.getMinutes().toString();

  hour = hour.padStart(2, '0');
  mins = mins.padStart(2, '0');

  console.log(`${hour}:${mins}`);
}

formatTime(today);
formatTime(tomorrow);
formatTime(nextWeek);
