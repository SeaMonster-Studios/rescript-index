open Belt

%%raw(`import "swiper/swiper.min.css"`)

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
      swiperRef>
      {posts
      ->Array.map(post => {
        <Swiper8.Slide>
          <div tabIndex=0>
            <h2 className="text-xl font-bold"> {post.title->React.string} </h2>
            <p dangerouslySetInnerHTML={"__html": post.excerpt} />
            <a className="underline" href={post.url}> {"Read more"->React.string} </a>
          </div>
        </Swiper8.Slide>
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
