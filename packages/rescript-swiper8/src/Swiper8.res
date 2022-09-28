type t 

@send @scope("swiper")
external slidePrev: t => unit = "slidePrev"

@send @scope("swiper")
external slideNext: t => unit = "slideNext"

@send @scope("swiper")
external slideTo: (t, int) => unit = "slideTo"

@react.component @module("swiper/react")
external make: (
  ~id: string=?,
  ~children: React.element,
  ~allowTouchMove: bool=?,
  ~autoHeight: bool=?,
  ~loop: bool=?,
  ~ref: ReactDOM.domRef,
  ~slidesPerView: float=?,
  ~spaceBetween: int=?,
  ~tag: string=?,
  ~wrapperTag: string=?,
  ~\"aria-label": string=?,
  ~onInit: t => unit=?,
  ~onSwiper: t => unit=?,
  ~onSlideChange: t => unit=?,
  ~onSlideChangeTransitionEnd: t => unit=?,
  ~onProgress: t => unit=?,
  ~onAfterInit: t => unit=?,
  ~onRealIndexChange: t => unit=?,
  ~a11y: bool=?,
) => React.element = "Swiper"

module Slide = {
  @react.component @module("swiper/react")
  external make: (~children: React.element) => React.element = "SwiperSlide"
}

type component

@module("swiper") external autoplay: component = "Autoplay"
@module("swiper") external pagination: component = "Pagination"
@module("swiper") external controller: component = "Controller"

@module("./Swiper8_external.js")
external fixA11y: t => unit = "fixA11y"
