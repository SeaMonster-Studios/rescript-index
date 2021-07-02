//https://www.npmjs.com/package/faker

module Address = {
  @val @module("faker") @scope("address")
  external zipCode: unit => string = "zipCode"

  @val @module("faker") @scope("address")
  external zipCodeByState: string => string = "zipCodeByState"

  @val @module("faker") @scope("address")
  external city: unit => string = "city"

  @val @module("faker") @scope("address")
  external cityPrefix: unit => string = "cityPrefix"

  @val @module("faker") @scope("address")
  external citySuffix: unit => string = "citySuffix"

  @val @module("faker") @scope("address")
  external cityName: unit => string = "cityName"

  @val @module("faker") @scope("address")
  external streetName: unit => string = "streetName"

  @val @module("faker") @scope("address")
  external streetAddress: unit => string = "streetAddress"

  @val @module("faker") @scope("address")
  external streetSuffix: unit => string = "streetSuffix"

  @val @module("faker") @scope("address")
  external streetPrefix: unit => string = "streetPrefix"

  @val @module("faker") @scope("address")
  external secondaryAddress: unit => string = "secondaryAddress"

  @val @module("faker") @scope("address")
  external county: unit => string = "county"

  @val @module("faker") @scope("address")
  external country: unit => string = "country"

  @val @module("faker") @scope("address")
  external countryCode: unit => string = "countryCode"

  @val @module("faker") @scope("address")
  external state: unit => string = "state"

  @val @module("faker") @scope("address")
  external stateAbbr: unit => string = "stateAbbr"

  @val @module("faker") @scope("address")
  external latitude: unit => string = "latitude"

  @val @module("faker") @scope("address")
  external longitude: unit => string = "longitude"

  @val @module("faker") @scope("address")
  external direction: unit => string = "direction"

  @val @module("faker") @scope("address")
  external cardinalDirection: unit => string = "cardinalDirection"

  @val @module("faker") @scope("address")
  external ordinalDirection: unit => string = "ordinalDirection"

  @val @module("faker") @scope("address")
  external nearbyGPSCoordinate: unit => string = "nearbyGPSCoordinate"

  @val @module("faker") @scope("address")
  external timeZone: unit => string = "timeZone"
}

module Animal = {
  @val @module("faker") @scope("animal")
  external dog: unit => string = "dog"

  @val @module("faker") @scope("animal")
  external cat: unit => string = "cat"

  @val @module("faker") @scope("animal")
  external snake: unit => string = "snake"

  @val @module("faker") @scope("animal")
  external bear: unit => string = "bear"

  @val @module("faker") @scope("animal")
  external lion: unit => string = "lion"

  @val @module("faker") @scope("animal")
  external cetacean: unit => string = "cetacean"

  @val @module("faker") @scope("animal")
  external horse: unit => string = "horse"

  @val @module("faker") @scope("animal")
  external bird: unit => string = "bird"

  @val @module("faker") @scope("animal")
  external cow: unit => string = "cow"

  @val @module("faker") @scope("animal")
  external fish: unit => string = "fish"

  @val @module("faker") @scope("animal")
  external crocodilia: unit => string = "crocodilia"

  @val @module("faker") @scope("animal")
  external insect: unit => string = "insect"

  @val @module("faker") @scope("animal")
  external rabbit: unit => string = "rabbit"

  @val @module("faker") @scope("animal")
  external type_: unit => string = "type"
}

module Commerce = {
  @val @module("faker") @scope("commerce")
  external color: unit => string = "color"

  @val @module("faker") @scope("commerce")
  external department: unit => string = "department"

  @val @module("faker") @scope("commerce")
  external productName: unit => string = "productName"

  @val @module("faker") @scope("commerce")
  external price: unit => string = "price"

  @val @module("faker") @scope("commerce")
  external productAdjective: unit => string = "productAdjective"

  @val @module("faker") @scope("commerce")
  external productMaterial: unit => string = "productMaterial"

  @val @module("faker") @scope("commerce")
  external product: unit => string = "product"

  @val @module("faker") @scope("commerce")
  external productDescription: unit => string = "productDescription"
}

module Company = {
  @val @module("faker") @scope("company")
  external suffixes: unit => string = "suffixes"

  @val @module("faker") @scope("company")
  external companyName: unit => string = "companyName"

  @val @module("faker") @scope("company")
  external companySuffix: unit => string = "companySuffix"

  @val @module("faker") @scope("company")
  external catchPhrase: unit => string = "catchPhrase"

  @val @module("faker") @scope("company")
  external bs: unit => string = "bs"

  @val @module("faker") @scope("company")
  external catchPhraseAdjective: unit => string = "catchPhraseAdjective"

  @val @module("faker") @scope("company")
  external catchPhraseDescriptor: unit => string = "catchPhraseDescriptor"

  @val @module("faker") @scope("company")
  external catchPhraseNoun: unit => string = "catchPhraseNoun"

  @val @module("faker") @scope("company")
  external bsAdjective: unit => string = "bsAdjective"

  @val @module("faker") @scope("company")
  external bsBuzz: unit => string = "bsBuzz"

  @val @module("faker") @scope("company")
  external bsNoun: unit => string = "bsNoun"
}

module Database = {
  @val @module("faker") @scope("database")
  external column: unit => string = "column"

  @val @module("faker") @scope("database")
  external type_: unit => string = "type"

  @val @module("faker") @scope("database")
  external collation: unit => string = "collation"

  @val @module("faker") @scope("database")
  external engine: unit => string = "engine"
}

module Datatype = {
  @val @module("faker") @scope("datatype")
  external uuid: unit => string = "uuid"

  @val @module("faker") @scope("datatype")
  external number: unit => int = "number"

  type range = {
    min: int,
    max: int,
  }

  @val @module("faker") @scope("datatype")
  external numberWithRange: range => int = "number"

  @val @module("faker") @scope("datatype")
  external float: unit => float = "float"

  @val @module("faker") @scope("datatype")
  external datetime: unit => Js.Date.t = "datetime"

  @val @module("faker") @scope("datatype")
  external string: unit => int = "string"

  @val @module("faker") @scope("datatype")
  external boolean: unit => bool = "boolean"

  @val @module("faker") @scope("datatype")
  external hexaDecimal: unit => string = "hexaDecimal"

  @val @module("faker") @scope("datatype")
  external json: unit => Js.Json.t = "json"

  @val @module("faker") @scope("datatype")
  external array: unit => array<'a> = "array"
}

module Date = {
  @val @module("faker") @scope("date")
  external past: unit => Js.Date.t = "past"

  @val @module("faker") @scope("date")
  external future: unit => Js.Date.t = "future"

  @val @module("faker") @scope("date")
  external between: (Js.Date.t, Js.Date.t) => Js.Date.t = "between"

  @val @module("faker") @scope("date")
  external betweens: (Js.Date.t, Js.Date.t) => Js.Date.t = "betweens"

  @val @module("faker") @scope("date")
  external recent: unit => Js.Date.t = "recent"

  @val @module("faker") @scope("date")
  external soon: unit => Js.Date.t = "soon"

  @val @module("faker") @scope("date")
  external month: unit => Js.Date.t = "month"

  @val @module("faker") @scope("date")
  external weekday: unit => Js.Date.t = "weekday"
}

module Finance = {
  @val @module("faker") @scope("finance")
  external account: unit => string = "account"

  @val @module("faker") @scope("finance")
  external accountName: unit => string = "accountName"

  @val @module("faker") @scope("finance")
  external routingNumber: unit => int = "routingNumber"

  @val @module("faker") @scope("finance")
  external mask: unit => string = "mask"

  @val @module("faker") @scope("finance")
  external amount: unit => float = "amount"

  @val @module("faker") @scope("finance")
  external transactionType: unit => string = "transactionType"

  @val @module("faker") @scope("finance")
  external currencyCode: unit => string = "currencyCode"

  @val @module("faker") @scope("finance")
  external currencyName: unit => string = "currencyName"

  @val @module("faker") @scope("finance")
  external currencySymbol: unit => string = "currencySymbol"

  @val @module("faker") @scope("finance")
  external bitcoinAddress: unit => string = "bitcoinAddress"

  @val @module("faker") @scope("finance")
  external litecoinAddress: unit => string = "litecoinAddress"

  @val @module("faker") @scope("finance")
  external creditCardNumber: unit => int = "creditCardNumber"

  @val @module("faker") @scope("finance")
  external creditCardCvv: unit => int = "creditCardCVV"

  @val @module("faker") @scope("finance")
  external ethereumAddress: unit => string = "ethereumAddress"

  @val @module("faker") @scope("finance")
  external iban: unit => string = "iban"

  @val @module("faker") @scope("finance")
  external bic: unit => string = "bic"

  @val @module("faker") @scope("finance")
  external transactionDescription: unit => string = "transactionDescription"
}

module Git = {
  @val @module("faker") @scope("git")
  external branch: unit => string = "branch"

  @val @module("faker") @scope("git")
  external commitEntry: unit => string = "commitEntry"

  @val @module("faker") @scope("git")
  external commitMessage: unit => string = "commitMessage"

  @val @module("faker") @scope("git")
  external commitSha: unit => string = "commitSha"

  @val @module("faker") @scope("git")
  external shortSha: unit => string = "shortSha"
}

module Haker = {
  @val @module("faker") @scope("haker")
  external abbreviation: unit => string = "abbreviation"

  @val @module("faker") @scope("haker")
  external adjective: unit => string = "adjective"

  @val @module("faker") @scope("haker")
  external noun: unit => string = "noun"

  @val @module("faker") @scope("haker")
  external verb: unit => string = "verb"

  @val @module("faker") @scope("haker")
  external ingverb: unit => string = "ingverb"

  @val @module("faker") @scope("haker")
  external phrase: unit => string = "phrase"
}

module Helpers = {
  @val @module("faker") @scope("helpers")
  external randomize: array<'a> => array<'a> = "randomize"

  @val @module("faker") @scope("helpers")
  external slugify: string => string = "slugify"

  @val @module("faker") @scope("helpers")
  external replaceSymbolWithNumber: string => float = "replaceSymbolWithNumber"

  @val @module("faker") @scope("helpers")
  external replaceSymbols: string => string = "replaceSymbols"

  @val @module("faker") @scope("helpers")
  external replaceCreditCardSymbols: (~str: string=?, ~symbol: string=?) => string =
    "replaceCreditCardSymbols"

  @val @module("faker") @scope("helpers")
  external repeatString: string => string = "repeatString"

  @val @module("faker") @scope("helpers")
  external regexpStyleStringParse: array<'a> => array<'a> = "regexpStyleStringParse"

  @val @module("faker") @scope("helpers")
  external mustache: (~str: string=?, ~data: 'd=?) => string = "mustache"

  @val @module("faker") @scope("helpers")
  external createCard: unit => {..} = "createCard"

  @val @module("faker") @scope("helpers")
  external contextualCard: unit => {..} = "contextualCard"

  @val @module("faker") @scope("helpers")
  external userCard: unit => {..} = "userCard"

  @val @module("faker") @scope("helpers")
  external createTransaction: unit => {..} = "createTransaction"
}

module Image = {
  @val @module("faker") @scope("image")
  external image: unit => string = "image"

  @val @module("faker") @scope("image")
  external avatar: unit => string = "avatar"

  @val @module("faker") @scope("image")
  external imageUrl: unit => string = "imageUrl"

  @val @module("faker") @scope("image")
  external abstract: unit => string = "abstract"

  @val @module("faker") @scope("image")
  external animals: unit => string = "animals"

  @val @module("faker") @scope("image")
  external business: unit => string = "business"

  @val @module("faker") @scope("image")
  external cats: unit => string = "cats"

  @val @module("faker") @scope("image")
  external city: unit => string = "city"

  @val @module("faker") @scope("image")
  external food: unit => string = "food"

  @val @module("faker") @scope("image")
  external nightlife: unit => string = "nightlife"

  @val @module("faker") @scope("image")
  external fashion: unit => string = "fashion"

  @val @module("faker") @scope("image")
  external people: unit => string = "people"

  @val @module("faker") @scope("image")
  external nature: unit => string = "nature"

  @val @module("faker") @scope("image")
  external sports: unit => string = "sports"

  @val @module("faker") @scope("image")
  external technics: unit => string = "technics"

  @val @module("faker") @scope("image")
  external transport: unit => string = "transport"

  @val @module("faker") @scope("image")
  external dataUri: unit => string = "dataUri"

  @val @module("faker") @scope("image")
  external lorempixel: unit => string = "lorempixel"

  @val @module("faker") @scope("image")
  external unsplash: unit => string = "unsplash"

  @val @module("faker") @scope("image")
  external lorempicsum: unit => string = "lorempicsum"
}
module Internet = {
  @val @module("faker") @scope("internet")
  external avatar: unit => string = "avatar"

  @val @module("faker") @scope("internet")
  external email: unit => string = "email"

  @val @module("faker") @scope("internet")
  external exampleEmail: unit => string = "exampleEmail"

  @val @module("faker") @scope("internet")
  external userName: unit => string = "userName"

  @val @module("faker") @scope("internet")
  external protocol: unit => string = "protocol"

  @val @module("faker") @scope("internet")
  external httpMethod: unit => string = "httpMethod"

  @val @module("faker") @scope("internet")
  external url: unit => string = "url"

  @val @module("faker") @scope("internet")
  external domainName: unit => string = "domainName"

  @val @module("faker") @scope("internet")
  external domainSuffix: unit => string = "domainSuffix"

  @val @module("faker") @scope("internet")
  external domainWord: unit => string = "domainWord"

  @val @module("faker") @scope("internet")
  external ip: unit => string = "ip"

  @val @module("faker") @scope("internet")
  external ipv6: unit => string = "ipv6"

  @val @module("faker") @scope("internet")
  external port: unit => string = "port"

  @val @module("faker") @scope("internet")
  external userAgent: unit => string = "userAgent"

  @val @module("faker") @scope("internet")
  external color: unit => string = "color"

  @val @module("faker") @scope("internet")
  external mac: unit => string = "mac"

  @val @module("faker") @scope("internet")
  external password: unit => string = "password"
}

module Lorem = {
  @val @module("faker") @scope("lorem")
  external word: unit => string = "word"

  @val @module("faker") @scope("lorem")
  external words: unit => string = "words"

  @val @module("faker") @scope("lorem")
  external sentence: unit => string = "sentence"

  @val @module("faker") @scope("lorem")
  external slug: unit => string = "slug"

  @val @module("faker") @scope("lorem")
  external sentences: unit => string = "sentences"

  @val @module("faker") @scope("lorem")
  external paragraph: unit => string = "paragraph"

  @val @module("faker") @scope("lorem")
  external paragraphs: unit => string = "paragraphs"

  @val @module("faker") @scope("lorem")
  external text: unit => string = "text"

  @val @module("faker") @scope("lorem")
  external lines: unit => string = "lines"
}

module Merseene = {
  @val @module("faker") @scope("mersenne")
  external rand: unit => 'a = "rand"

  @val @module("faker") @scope("mersenne")
  external seed: unit => 'a = "seed"

  @val @module("faker") @scope("mersenne")
  external seed_array: unit => 'a = "seed_array"
}

module Music = {
  @val @module("faker") @scope("music")
  external genre: unit => 'a = "genre"
}

module Name = {
  @val @module("faker") @scope("name")
  external firstName: unit => string = "firstName"

  @val @module("faker") @scope("name")
  external lastName: unit => string = "lastName"

  let fullName = () => j`${firstName()} ${lastName()}`

  @val @module("faker") @scope("name")
  external middleName: unit => string = "middleName"

  @val @module("faker") @scope("name")
  external findName: unit => string = "findName"

  @val @module("faker") @scope("name")
  external jobTitle: unit => string = "jobTitle"

  @val @module("faker") @scope("name")
  external gender: unit => string = "gender"

  @val @module("faker") @scope("name")
  external prefix: unit => string = "prefix"

  @val @module("faker") @scope("name")
  external suffix: unit => string = "suffix"

  @val @module("faker") @scope("name")
  external title: unit => string = "title"

  @val @module("faker") @scope("name")
  external jobDescriptor: unit => string = "jobDescriptor"

  @val @module("faker") @scope("name")
  external jobArea: unit => string = "jobArea"

  @val @module("faker") @scope("name")
  external jobType: unit => string = "jobType"
}

module Phone = {
  @val @module("faker") @scope("phone")
  external phoneNumber: unit => string = "phoneNumber"

  @val @module("faker") @scope("phone")
  external phoneNumberFormat: unit => 'a = "phoneNumberFormat"

  @val @module("faker") @scope("phone")
  external phoneFormats: unit => array<'a> = "phoneNumber"
}

module System = {
  @val @module("faker") @scope("system")
  external fileName: unit => string = "fileName"

  @val @module("faker") @scope("system")
  external commonFileName: unit => string = "commonFileName"

  @val @module("faker") @scope("system")
  external mimeType: unit => string = "mimeType"

  @val @module("faker") @scope("system")
  external commonFileType: unit => string = "commonFileType"

  @val @module("faker") @scope("system")
  external commonFileExt: unit => string = "commonFileExt"

  @val @module("faker") @scope("system")
  external fileType: unit => string = "fileType"

  @val @module("faker") @scope("system")
  external fileExt: unit => string = "fileExt"

  @val @module("faker") @scope("system")
  external directoryPath: unit => string = "directoryPath"

  @val @module("faker") @scope("system")
  external filePath: unit => string = "filePath"

  @val @module("faker") @scope("system")
  external semver: unit => string = "semver"
}

module Time = {
  @val @module("faker") @scope("time")
  external recent: unit => string = "recent"
}

module Vehicle = {
  @val @module("faker") @scope("vehicle")
  external vehicle: unit => string = "vehicle"

  @val @module("faker") @scope("vehicle")
  external manufacturer: unit => string = "manufacturer"

  @val @module("faker") @scope("vehicle")
  external model: unit => string = "model"

  @val @module("faker") @scope("vehicle")
  external type_: unit => string = "type"

  @val @module("faker") @scope("vehicle")
  external fuel: unit => string = "fuel"

  @val @module("faker") @scope("vehicle")
  external vin: unit => string = "vin"

  @val @module("faker") @scope("vehicle")
  external color: unit => string = "color"

  @val @module("faker") @scope("vehicle")
  external vrm: unit => string = "vrm"

  @val @module("faker") @scope("vehicle")
  external bicycle: unit => string = "bicycle"
}
