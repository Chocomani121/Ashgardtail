document.addEventListener('DOMContentLoaded', function() {
  const fadeElements = document.querySelectorAll('.fade-scroll, .fade-scroll-right, .fade-scroll-top');

  // ✅ Disable fade entirely for small screens
  if (window.innerWidth <= 768) {
    fadeElements.forEach(el => {
      el.classList.remove('opacity-0');
      el.classList.add('opacity-100');
    });
    return;
  }

  // ✅ Intersection Observer for desktop/tablet
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        // Fade in when element enters viewport
        entry.target.classList.add('opacity-100');
        entry.target.classList.remove('opacity-0');
      } else {
        // Optional: keep it visible once shown
        // Comment out below 2 lines if you don't want it to fade out again
        entry.target.classList.remove('opacity-100');
        entry.target.classList.add('opacity-0');
      }
    });
  }, {
    root: null,
    threshold: 0.2, // 🔥 trigger when 20% of the element is visible
    rootMargin: '0px 0px -50px 0px'
  });

  fadeElements.forEach(el => observer.observe(el));
});





// document.addEventListener('DOMContentLoaded', function() {
//     // Select fade elements (paragraphs and right-slide svgs)
//     const fadeElements = document.querySelectorAll('.fade-scroll, .fade-scroll-right');

//     const observer = new IntersectionObserver((entries) => {
//         entries.forEach(entry => {
//             if (entry.isIntersecting) {
//                 // Fade in when element enters viewport
//                 entry.target.classList.add('opacity-100');
//                 entry.target.classList.remove('opacity-0');
//             } else {
//                 // Reset fade when element leaves viewport
//                 entry.target.classList.remove('opacity-100');
//                 entry.target.classList.add('opacity-0');
//             }
//         });
//     }, {
//         root: null, // viewport
//         threshold: 1, // trigger when 10% of the element is visible
//         rootMargin: '-50px' // slight offset to trigger earlier
//     });

//     // Start observing each paragraph
//     fadeElements.forEach(element => {
//         observer.observe(element);
//     });
// });