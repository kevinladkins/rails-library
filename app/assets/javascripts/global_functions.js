"use strict";

function alphabetize(obj, attr) {
  let alpha = obj.sort(function(a, b){
    if(a[attr] < b[attr]) return -1;
    if(a[attr] > b[attr]) return 1;
    return 0;
  })
  return alpha
}



function orderedList() {
  let html = `<ol></ol>`;
  return html
}

function bookTable() {
  let html = `
   <table class="table table-striped catalogue-table">
     <thead>
       <tr>
         <th>Title</th>
         <th>Author</th>
       </tr>
     </thead>
     <tbody></tbody>
   </table>`;
  return html
}

function unorderedList() {
  let html = `<ul></ul>`;
  return html
}
