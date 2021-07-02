type width = string
type height = string
type latitude = float
type longitude = float
type zoom = int

type viewport = {
  "width": width,
  "height": height,
  "latitude": latitude,
  "longitude": longitude,
  "zoom": zoom,
}

type mapOptions = {"trackResize": bool}

@module("react-map-gl") @react.component
external make: (
  ~width: width,
  ~height: height,
  ~latitude: latitude,
  ~longitude: longitude,
  ~zoom: zoom,
  ~mapboxApiAccessToken: string,
  ~mapOptions: mapOptions=?,
  ~mapStyle: string=?,
  ~scrollZoom: bool=?,
  ~onViewportChange: viewport => unit=?,
  ~dragPan: bool=?,
  ~dragRotate: bool=?,
  ~children: React.element=?,
) => React.element = "default"

module SVGOverlay = {
  type redraw = {
    "project": array<int> => array<int>,
    "width": width,
    "height": height,
    "latitude": latitude,
    "longitude": longitude,
    "zoom": zoom,
  }

  @module("react-map-gl") @react.component
  external make: (~redraw: redraw => React.element) => React.element = "SVGOverlay"
}

module Marker = {
  type event = {"lngLat": array<int>}

  @module("react-map-gl") @react.component
  external make: (
    ~latitude: latitude,
    ~longitude: longitude,
    ~offsetLeft: int=?,
    ~offsetTop: int=?,
    ~draggable: bool=?,
    ~onDragStart: unit => unit=?,
    ~onDrag: unit => unit=?,
    ~onDragEnd: unit => unit=?,
    ~captureScroll: bool=?,
    ~captureDrag: bool=?,
    ~captureClick: bool=?,
    ~captureDoubleClick: bool=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "Marker"
}

module NavigationControl = {
  @module("react-map-gl") @react.component
  external make: (
    ~onViewportChange: unit => unit=?,
    ~showCompass: bool=?,
    ~showZoom: bool=?,
    ~captureScroll: bool=?,
    ~captureClick: bool=?,
    ~captureDrag: bool=?,
    ~captureDoubleClick: bool=?,
  ) => React.element = "NavigationControl"
}

module Popup = {
  @module("react-map-gl") @react.component
  external make: (
    ~latitude: latitude,
    ~longitude: longitude,
    ~altitude: int=?,
    ~offsetLeft: int=?,
    ~offsetTop: int=?,
    ~closeButton: bool=?,
    ~closeOnClick: bool=?,
    ~tipSize: int=?,
    ~anchor: @string
    [
      | #bottom
      | #top
      | #right
      | #left
      | @as("top-left") #topLeft
      | @as("top-right") #topRight
      | @as("bottom-left") #bottomLeft
      | @as("bottom-right") #bottomRight
    ]=?,
    ~dynamicPosition: bool=?,
    ~sortByDepth: bool=?,
    ~onClose: unit => unit=?,
    ~captureScroll: bool=?,
    ~captureClick: bool=?,
    ~captureDrag: bool=?,
    ~captureDoubleClick: bool=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "Popup"
}
