type swiperModule

module Pagination = {
  @module("swiper") external pagination: swiperModule = "Pagination"

  @deriving(abstract)
  type config = {
    @optional
    clickable: bool,
    @optional
    \"type": string,
    @optional
    bulletClass: string,
    @optional
    bulletActiveClass: string,
  }
}

module Slide = {
  type t

  external toUnsafeObj: t => {..} = "%identity"

  @send
  external focus: t => unit = "focus"

  @react.component @module("swiper/react")
  external make: (~children: React.element) => React.element = "SwiperSlide"

  module WithProps = {
    type props = {
      isActive: bool,
      isPrev: bool,
      isNext: bool,
      isDuplicate: bool,
      isVisible: bool,
    }
    @react.component @module("swiper/react")
    external make: (~children: props => React.element) => React.element = "SwiperSlide"
  }
}

type t

type params = {loop: bool}

@send
external slidePrev: t => unit = "slidePrev"
@send
external slideNext: t => unit = "slideNext"
@send
external slideTo: (t, int) => unit = "slideTo"
@send
external slideToClosest: t => unit = "slideToClosest"
@send
external slideToLoop: (t, int) => unit = "slideToLoop"
@get
external getActiveIndex: t => int = "activeIndex"
@get
external getRealIndex: t => int = "realIndex"
@get
external getParams: t => params = "params"
@get
external getSlides: t => array<Slide.t> = "slides"
@get
external getVisibleSlides: t => array<Slide.t> = "visibleSlides"
@send
external on: (t, string, unit => unit) => unit = "on"
@send
external offAll: (t, string) => unit = "off"

@get @return(nullable)
external getFromDom: Dom.element => option<t> = "swiper"

let getFromDom: Js.Nullable.t<Dom.element> => option<t> = el => {
  el->Js.Nullable.toOption->Belt.Option.flatMap(getFromDom)
}

@react.component @module("swiper/react")
external make: (
  ~id: string=?,
  ~children: React.element,
  ~allowTouchMove: bool=?,
  ~autoHeight: bool=?,
  ~loop: bool=?,
  ~ref: ReactDOM.domRef,
  ~slidesPerView: float=?,
  ~slidesOffsetBefore: int=?,
  ~spaceBetween: int=?,
  ~tag: string=?,
  ~wrapperTag: string=?,
  ~\"aria-label": string=?,
  ~onInit: t => unit=?,
  ~onSwiper: t => unit=?,
  ~onSlideChange: t => unit=?,
  ~onSlideChangeTransitionEnd: t => unit=?,
  ~onSlideNextTransitionEnd: t => unit=?,
  ~onProgress: t => unit=?,
  ~onAfterInit: t => unit=?,
  ~onRealIndexChange: t => unit=?,
  ~a11y: bool=?,
  ~centeredSlides: bool=?,
  ~modules: array<swiperModule>=?,
  ~pagination: Pagination.config=?,
  ~watchSlidesProgress: bool=?,
  ~watchOverflow: bool=?,
) => React.element = "Swiper"

type component

@module("swiper") external autoplay: component = "Autoplay"
@module("swiper") external pagination: component = "Pagination"
@module("swiper") external controller: component = "Controller"
