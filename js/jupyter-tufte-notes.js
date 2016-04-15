var currentY = -1;

$(window).load(function () {
    $('html, body').animate({ scrollTop: 0 }, 0);

    $('img, .notes').each(function(i) {
        var parents = $(this).parents()
        var boundingBox = null;
        for (var i = 0; i < parents.length; i++) {
             if (parents[i].className.indexOf('output_wrapper') > -1) {
                 parents[i].style.display = "none";
             }

             if (parents[i].className.indexOf('cell') > -1) {
                 var boundingBox = parents[i].children[0].getBoundingClientRect()
                 console.log(parents[i].children[0])
                 console.log(boundingBox.top + ', '+currentY)
                 currentY = Math.max(currentY, boundingBox.top)
                 break;
             }
        }

        $(this).detach()
               .appendTo('#notes')
               .css({'width': '100%'});

        $(this).css({'position': 'absolute', 'top': currentY});
        currentY = currentY + $(this).height();
    })
})
