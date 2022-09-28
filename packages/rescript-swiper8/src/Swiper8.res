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

type t

type params = {loop: bool}

@send
external slidePrev: t => unit = "slidePrev"
@send
external slideNext: t => unit = "slideNext"
@send
external slideTo: (t, int) => unit = "slideTo"
@send
external slideToLoop: (t, int) => unit = "slideToLoop"
@get
external getActiveIndex: t => int = "activeIndex"
@get
external getRealIndex: t => int = "realIndex"
@get
external getParams: t => params = "params"

@get @return(nullable)
external getFromDom: Js.Nullable.t<Dom.element> => option<t> = "swiper"

module SwiperReact = {
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
    ~onProgress: t => unit=?,
    ~onAfterInit: t => unit=?,
    ~onRealIndexChange: t => unit=?,
    ~a11y: bool=?,
    ~centeredSlides: bool=?,
    ~modules: array<swiperModule>=?,
    ~pagination: Pagination.config=?,
  ) => React.element = "Swiper"
}

module Slide = {
  @react.component @module("swiper/react")
  external make: (~children: React.element) => React.element = "SwiperSlide"
}

type component

@module("swiper") external autoplay: component = "Autoplay"
@module("swiper") external pagination: component = "Pagination"
@module("swiper") external controller: component = "Controller"

module A11y = {
  /*
   * For some reason, in the `onInit` event, swiper.slides might not contain all
   * of the expected slides. This causes our accessibility hack/fix to break.
   * But the swiper reference in the `onSlideChange` event does have a
   * swiper.slides that gives us all the expected slides.  So here we're just
   * forcing an `onSlideChange` event on initialization by "sliding" to the first
   * slide.
   */
  let useSwiperA11yWorkaround = (~swiperRef: React.ref<Js.Nullable.t<Dom.element>>) => {
    React.useEffect1(() => {
      let swiper = swiperRef.current->getFromDom
      swiper->Belt.Option.forEach(swiper => {
        let swiperParams = swiper->getParams
        let slideTo = swiperParams.loop ? slideToLoop : slideTo
        swiper->slideTo(0)
      })
      None
    }, [swiperRef.current])
  }

  @module("./Swiper8_external.js")
  external fixA11y: t => unit = "fixA11y"
}

/* Wrapper component that auto-applies accessibility fixes */
@react.component
let make = (
  ~id: option<string>=?,
  ~children: React.element,
  ~allowTouchMove: option<bool>=?,
  ~autoHeight: option<bool>=?,
  ~loop: option<bool>=?,
  ~swiperRef: React.ref<Js.Nullable.t<Dom.element>>,
  ~slidesPerView: option<float>=?,
  ~slidesOffsetBefore: option<int>=?,
  ~spaceBetween: option<int>=?,
  ~tag: option<string>=?,
  ~wrapperTag: option<string>=?,
  ~\"aria-label": option<string>=?,
  ~onInit: option<t => unit>=?,
  ~onSwiper: option<t => unit>=?,
  ~onSlideChange: option<t => unit>=?,
  ~onSlideChangeTransitionEnd: option<t => unit>=?,
  ~onProgress: option<t => unit>=?,
  ~onAfterInit: option<t => unit>=?,
  ~onRealIndexChange: option<t => unit>=?,
  ~a11y: option<bool>=?,
  ~centeredSlides: option<bool>=?,
  ~modules: option<array<swiperModule>>=?,
  ~pagination: option<Pagination.config>=?,
) => {
  A11y.useSwiperA11yWorkaround(~swiperRef)

  <SwiperReact
    ?id
    ?allowTouchMove
    ?autoHeight
    ?loop
    ?centeredSlides
    ref={ReactDOM.Ref.domRef(swiperRef)}
    ?slidesPerView
    ?slidesOffsetBefore
    ?spaceBetween
    ?tag
    ?wrapperTag
    ?\"aria-label"
    ?onInit
    ?onSwiper
    ?modules
    ?pagination
    onSlideChange={swiper => {
      A11y.fixA11y(swiper)
      onSlideChange->Belt.Option.forEach(f => f(swiper))
    }}
    onSlideChangeTransitionEnd={swiper => {
      A11y.fixA11y(swiper)
      onSlideChangeTransitionEnd->Belt.Option.forEach(f => f(swiper))
    }}
    ?onProgress
    ?onAfterInit
    ?onRealIndexChange
    ?a11y>
    children
  </SwiperReact>
}
