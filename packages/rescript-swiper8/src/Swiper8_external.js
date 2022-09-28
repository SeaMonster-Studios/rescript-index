/* Prereqs: inert polyfill https://github.com/nolimits4web/swiper/issues/3149#issuecomment-715482955 */
import "wicg-inert"

/* 
 * To improve a11y we hide slides that are (partially) out of view from
 * screen-readers/tab-navigation, forcing the user to use (required) pagination
 * buttons for navigating to next/previous slides. 
 */
export function fixA11y(swiper) {
  console.log(swiper.slides)
  let currentSlideEl = swiper.slides[swiper.activeIndex]
  let currentSlideIndex = swiper.slides.indexOf(currentSlideEl)
  let numFullyVisibleSlides = Math.trunc(swiper.params.slidesPerView)
  let lastFullyVisibleSlideIndex = currentSlideIndex + numFullyVisibleSlides - 1

  swiper.slides.forEach((slide, index) => {
    let slideIsFullyVisible = index >= currentSlideIndex && index <= lastFullyVisibleSlideIndex
    if (!slideIsFullyVisible) {
      slide.setAttribute("inert", "");
      slide.setAttribute("aria-hidden", "true");
    } else {
      slide.removeAttribute("inert");
      slide.removeAttribute("aria-hidden");
    }
  });
}