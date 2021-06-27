// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as React from "react";
import * as Caml_option from "@rescript/std/lib/es6/caml_option.js";
import * as UsePrevious from "@seamonster-studios/use-previous/src/UsePrevious.js";
import * as ReactQuery from "react-query";
import * as LodashIsequal from "lodash.isequal";

/* eslint-disable react-hooks/rules-of-hooks */

function useMakeReasonable(query, makeReasonable) {
  var prevQuery = UsePrevious.use(query);
  var match = React.useState(function () {
        return Curry._1(makeReasonable, query);
      });
  var setReasonable = match[1];
  React.useEffect((function () {
          if (!LodashIsequal(query, prevQuery)) {
            Curry._1(setReasonable, (function (param) {
                    return Curry._1(makeReasonable, query);
                  }));
          }
          
        }), [
        makeReasonable,
        query,
        prevQuery
      ]);
  return match[0];
}

function OptionTypes(Config) {
  return {};
}

function ResultTypes(Config) {
  return {};
}

var Cache = {};

function MakeCache(Config) {
  return {};
}

function Query(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  return {
          Cache: Cache,
          Options: Options,
          Result: Result,
          use: use
        };
}

function Paginated(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.resolvedData;
    var match$2 = query.latestData;
    var match$3 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$3 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$3
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) || (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1,
                _1: match$2
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.usePaginatedQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  return {
          Cache: Cache,
          Options: Options,
          Result: Result,
          use: use
        };
}

function Infinite(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch,
            fetchMore: query.fetchMore,
            canFetchMore: query.canFetchMore
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useInfiniteQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  return {
          Cache: Cache,
          Options: Options,
          Result: Result,
          use: use
        };
}

function Mutation(Config) {
  var Options = {};
  var isSuccess = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Success */1) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isIdle = function (t_rec) {
    var match = t_rec.status;
    return match === 0;
  };
  var isLoading = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number") {
      return match !== 0;
    } else {
      return false;
    }
  };
  var makeReasonable = function (param) {
    var result = param[1];
    var match = result.status;
    var match$1 = result.data;
    var match$2 = result.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Idle */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "idle" :
          tmp = /* Idle */0;
          break;
      case "loading" :
          tmp = /* Loading */1;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Idle */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Idle */0;
    }
    return [
            param[0],
            {
              status: tmp,
              promise: result.promise,
              reset: result.reset
            }
          ];
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isIdle: isIdle,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (options, fn) {
    return useMakeReasonable(ReactQuery.useMutation(fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  return {
          Options: Options,
          Result: Result,
          use: use
        };
}

var ConfigProvider = {};

var CacheProvider = {};

var SetConsole = {};

function QuerySet(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  var Query = {
    Cache: Cache,
    Options: Options,
    Result: Result,
    use: use
  };
  var Options$1 = {};
  var isSuccess$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Success */1) {
      return false;
    } else {
      return true;
    }
  };
  var isError$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isIdle = function (t_rec) {
    var match = t_rec.status;
    return match === 0;
  };
  var isLoading$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number") {
      return match !== 0;
    } else {
      return false;
    }
  };
  var makeReasonable$1 = function (param) {
    var result = param[1];
    var match = result.status;
    var match$1 = result.data;
    var match$2 = result.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Idle */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "idle" :
          tmp = /* Idle */0;
          break;
      case "loading" :
          tmp = /* Loading */1;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Idle */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Idle */0;
    }
    return [
            param[0],
            {
              status: tmp,
              promise: result.promise,
              reset: result.reset
            }
          ];
  };
  var Result$1 = {
    isSuccess: isSuccess$1,
    isError: isError$1,
    isIdle: isIdle,
    isLoading: isLoading$1,
    makeReasonable: makeReasonable$1
  };
  var use$1 = function (options, fn) {
    return useMakeReasonable(ReactQuery.useMutation(fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$1);
  };
  var Mutation = {
    Options: Options$1,
    Result: Result$1,
    use: use$1
  };
  return {
          Query: Query,
          Mutation: Mutation
        };
}

function PaginatedSet(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.resolvedData;
    var match$2 = query.latestData;
    var match$3 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$3 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$3
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) || (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1,
                _1: match$2
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.usePaginatedQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  var Paginated = {
    Cache: Cache,
    Options: Options,
    Result: Result,
    use: use
  };
  var Options$1 = {};
  var isSuccess$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Success */1) {
      return false;
    } else {
      return true;
    }
  };
  var isError$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isIdle = function (t_rec) {
    var match = t_rec.status;
    return match === 0;
  };
  var isLoading$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number") {
      return match !== 0;
    } else {
      return false;
    }
  };
  var makeReasonable$1 = function (param) {
    var result = param[1];
    var match = result.status;
    var match$1 = result.data;
    var match$2 = result.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Idle */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "idle" :
          tmp = /* Idle */0;
          break;
      case "loading" :
          tmp = /* Loading */1;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Idle */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Idle */0;
    }
    return [
            param[0],
            {
              status: tmp,
              promise: result.promise,
              reset: result.reset
            }
          ];
  };
  var Result$1 = {
    isSuccess: isSuccess$1,
    isError: isError$1,
    isIdle: isIdle,
    isLoading: isLoading$1,
    makeReasonable: makeReasonable$1
  };
  var use$1 = function (options, fn) {
    return useMakeReasonable(ReactQuery.useMutation(fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$1);
  };
  var Mutation = {
    Options: Options$1,
    Result: Result$1,
    use: use$1
  };
  return {
          Paginated: Paginated,
          Mutation: Mutation
        };
}

function InfiniteSet(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch,
            fetchMore: query.fetchMore,
            canFetchMore: query.canFetchMore
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useInfiniteQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  var Infinite = {
    Cache: Cache,
    Options: Options,
    Result: Result,
    use: use
  };
  var Options$1 = {};
  var isSuccess$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Success */1) {
      return false;
    } else {
      return true;
    }
  };
  var isError$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isIdle = function (t_rec) {
    var match = t_rec.status;
    return match === 0;
  };
  var isLoading$1 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number") {
      return match !== 0;
    } else {
      return false;
    }
  };
  var makeReasonable$1 = function (param) {
    var result = param[1];
    var match = result.status;
    var match$1 = result.data;
    var match$2 = result.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Idle */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "idle" :
          tmp = /* Idle */0;
          break;
      case "loading" :
          tmp = /* Loading */1;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Idle */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Idle */0;
    }
    return [
            param[0],
            {
              status: tmp,
              promise: result.promise,
              reset: result.reset
            }
          ];
  };
  var Result$1 = {
    isSuccess: isSuccess$1,
    isError: isError$1,
    isIdle: isIdle,
    isLoading: isLoading$1,
    makeReasonable: makeReasonable$1
  };
  var use$1 = function (options, fn) {
    return useMakeReasonable(ReactQuery.useMutation(fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$1);
  };
  var Mutation = {
    Options: Options$1,
    Result: Result$1,
    use: use$1
  };
  return {
          Infinite: Infinite,
          Mutation: Mutation
        };
}

function Make(Config) {
  var Cache = {};
  var Options = {};
  var isSuccess = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result = {
    isSuccess: isSuccess,
    isError: isError,
    isLoading: isLoading,
    makeReasonable: makeReasonable
  };
  var use = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable);
  };
  var Query = {
    Cache: Cache,
    Options: Options,
    Result: Result,
    use: use
  };
  var Cache$1 = {};
  var Options$1 = {};
  var isSuccess$1 = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError$1 = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading$1 = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable$1 = function (query) {
    var match = query.status;
    var match$1 = query.resolvedData;
    var match$2 = query.latestData;
    var match$3 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$3 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$3
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) || (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1,
                _1: match$2
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch
          };
  };
  var Result$1 = {
    isSuccess: isSuccess$1,
    isError: isError$1,
    isLoading: isLoading$1,
    makeReasonable: makeReasonable$1
  };
  var use$1 = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.usePaginatedQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$1);
  };
  var Paginated = {
    Cache: Cache$1,
    Options: Options$1,
    Result: Result$1,
    use: use$1
  };
  var Cache$2 = {};
  var Options$2 = {};
  var isSuccess$2 = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG === /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isError$2 = function (t) {
    var match = t.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isLoading$2 = function (t) {
    var match = t.status;
    if (typeof match === "number") {
      return true;
    } else {
      return false;
    }
  };
  var makeReasonable$2 = function (query) {
    var match = query.status;
    var match$1 = query.data;
    var match$2 = query.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Loading */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "loading" :
          tmp = /* Loading */0;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Loading */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Loading */0;
    }
    return {
            status: tmp,
            isFetching: query.isFetching,
            isStale: query.isStale,
            failureCount: query.failureCount,
            refetch: query.refetch,
            fetchMore: query.fetchMore,
            canFetchMore: query.canFetchMore
          };
  };
  var Result$2 = {
    isSuccess: isSuccess$2,
    isError: isError$2,
    isLoading: isLoading$2,
    makeReasonable: makeReasonable$2
  };
  var use$2 = function (key, vars, options, fn) {
    return useMakeReasonable(ReactQuery.useInfiniteQuery(key, vars !== undefined ? Caml_option.valFromOption(vars) : undefined, fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$2);
  };
  var Infinite = {
    Cache: Cache$2,
    Options: Options$2,
    Result: Result$2,
    use: use$2
  };
  var Options$3 = {};
  var isSuccess$3 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Success */1) {
      return false;
    } else {
      return true;
    }
  };
  var isError$3 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number" || match.TAG !== /* Error */0) {
      return false;
    } else {
      return true;
    }
  };
  var isIdle = function (t_rec) {
    var match = t_rec.status;
    return match === 0;
  };
  var isLoading$3 = function (t_rec) {
    var match = t_rec.status;
    if (typeof match === "number") {
      return match !== 0;
    } else {
      return false;
    }
  };
  var makeReasonable$3 = function (param) {
    var result = param[1];
    var match = result.status;
    var match$1 = result.data;
    var match$2 = result.error;
    var tmp;
    switch (match) {
      case "error" :
          tmp = (match$2 == null) ? /* Idle */0 : ({
                TAG: /* Error */0,
                _0: match$2
              });
          break;
      case "idle" :
          tmp = /* Idle */0;
          break;
      case "loading" :
          tmp = /* Loading */1;
          break;
      case "success" :
          tmp = (match$1 == null) ? /* Idle */0 : ({
                TAG: /* Success */1,
                _0: match$1
              });
          break;
      default:
        tmp = /* Idle */0;
    }
    return [
            param[0],
            {
              status: tmp,
              promise: result.promise,
              reset: result.reset
            }
          ];
  };
  var Result$3 = {
    isSuccess: isSuccess$3,
    isError: isError$3,
    isIdle: isIdle,
    isLoading: isLoading$3,
    makeReasonable: makeReasonable$3
  };
  var use$3 = function (options, fn) {
    return useMakeReasonable(ReactQuery.useMutation(fn, options !== undefined ? Caml_option.valFromOption(options) : undefined), makeReasonable$3);
  };
  var Mutation = {
    Options: Options$3,
    Result: Result$3,
    use: use$3
  };
  return {
          Query: Query,
          Paginated: Paginated,
          Infinite: Infinite,
          Mutation: Mutation
        };
}

export {
  OptionTypes ,
  ResultTypes ,
  Cache ,
  MakeCache ,
  Query ,
  Paginated ,
  Infinite ,
  Mutation ,
  ConfigProvider ,
  CacheProvider ,
  SetConsole ,
  QuerySet ,
  PaginatedSet ,
  InfiniteSet ,
  Make ,
  
}
/* react Not a pure module */
