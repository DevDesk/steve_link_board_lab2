// $(function(){
//   // alert('it is happening.')
//   //when click on up button... do something  ...make class on button
//   $('.ajax-vote').on('click',function(e){
//     //disable click
//     e.preventDefault();
//     //prevent bubbling
//     e.stopPropagation();
//     // alert('stop poking me')
//     var button = $(this)
//     var url = button.attr('href');
//     //sanity check
//     // alert("go to: "+url);

//     //4th parameter json below
//     $.post(url, {}, function(response){
//       //response.result, repsonse.votes
//       button.next('.vote-count').text(response.votes);
//       if(response.result){
//         button.before(button_to("&#8682".html_safe, post_create_vote_path(post), :class => "btn btn-default btn-xs disabled"));
//         button.remove();
//       }else{
//         alert('You already voted on this.')
//       }

//     },'json');

//   })

// });