open Belt

%%raw(`import "swiper/swiper.min.css"`)

/* Prereqs: inert polyfill https://github.com/nolimits4web/swiper/issues/3149#issuecomment-715482955 */
%%raw(`import "wicg-inert"`)

type post = {title: string, excerpt: string, url: string}

let posts: array<post> = [
  {
    title: "Hello World",
    excerpt: "This is my first post",
    url: "https://example.com/hello-world",
  },
  {
    title: "Hello World 2",
    excerpt: "This is my second post",
    url: "https://example.com/hello-world-2",
  },
  {
    title: "Hello World 3",
    excerpt: "This is my third post",
    url: "https://example.com/hello-world-3",
  },
  {
    title: "Hello World 4",
    excerpt: "This is my fourth post",
    url: "https://example.com/hello-world-4",
  },
  {
    title: "Hello World 5",
    excerpt: "This is my fifth post",
    url: "https://example.com/hello-world-5",
  },
]

let default = () => {
  let swiperRef = React.useRef(Js.Nullable.null)

  <div className="p-4">
    <button
      ariaControls="swiper-example"
      className="inline-flex items-center rounded border border-transparent bg-indigo-600 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
      onClick={_ => swiperRef.current->Swiper8.getFromDom->Option.forEach(Swiper8.slidePrev)}>
      {"Prev"->React.string}
    </button>
    <Swiper8
      tag="section"
      id="swiper-example"
      \"aria-label"="Example Content"
      loop=true
      allowTouchMove=true
      spaceBetween=20
      slidesPerView=3.5
      autoHeight=true
      ref={swiperRef->ReactDOM.Ref.domRef}
      watchSlidesProgress=true /* required to enable the isVisible prop for Slide.WithProps https://swiperjs.com/swiper-api#param-watchSlidesProgress */
      onSlideNextTransitionEnd={swiper => {
        /* This is an accessibility hack that forces the focus onto the last visible
         * slide when the user clicks the next button. This is helpful for tab navigation
         * so that users don't have to shift-tab back to the last visible slide after clicking
         * next.  This is not a problem when clicking previous since you can just tab
         * forward to select the first visible slide.
         */
        let visibleSlides = swiper->Swiper8.getVisibleSlides
        let lastVisibleSlide = visibleSlides[visibleSlides->Belt.Array.length - 1]
        lastVisibleSlide->Option.forEach(slide => {
          let slide = slide->Obj.magic
          let contentEl = slide["firstChild"]
          contentEl["focus"](.) /* ATTENTION: This function call must be uncurried. */
        })
      }}>
      {posts
      ->Array.map(post => {
        <Swiper8.Slide.WithProps>
          {props => {
            /* ATTENTION: Note that you must apply aria-hidden and "inert" to all slides that
             * aren't visible to restrict tab-navigation only to visible slides and prevent
             * screen readers from reading "hidden" slides.
             * For browser compatibility you should include the "wicg-inert" polyfill.
             */
            let el =
              <div tabIndex=0 className={"swiper-slide-contents"} ariaHidden={!props.isVisible}>
                <div> {`Active: ${props.isVisible ? "true" : "false"}`->React.string} </div>
                <h2 className="text-xl font-bold"> {post.title->React.string} </h2>
                <p dangerouslySetInnerHTML={"__html": post.excerpt} />
                <a className="underline" href={post.url}> {"Read more"->React.string} </a>
              </div>

            props.isVisible ? el : React.cloneElement(el, {"inert": ""})
          }}
        </Swiper8.Slide.WithProps>
      })
      ->React.array}
    </Swiper8>
    <button
      ariaControls="swiper-example"
      className="inline-flex items-center rounded border border-transparent bg-indigo-600 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
      onClick={_ => swiperRef.current->Swiper8.getFromDom->Option.forEach(Swiper8.slideNext)}>
      {"Next"->React.string}
    </button>
  </div>
}
