export const getMetaValue = (name) => {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}

const toParams = (params) =>
  Object.keys(params)
    .map((k) => encodeURIComponent(k) + "=" + encodeURIComponent(params[k]))
    .join("&")

const fetcher = {
  http: {
    get: (url, options) => {
      const getUrl = () => (options ? `${url}?${toParams(options)}` : url)

      return fetch(getUrl(), {
        headers: {
          "X-CSRF-Token": getMetaValue("csrf-token")
        }
      }).then((response) => response.json())
    },

    post: (url, options) => {
      return fetch(url, {
        ...options,
        method: "POST",
        headers: {
          "X-CSRF-Token": getMetaValue("csrf-token")
        }
      }).then((response) => response.json())
    },

    put: (url, options) => {
      fetch(url, {
        ...options,
        method: "PUT",
        headers: {
          "X-CSRF-Token": getMetaValue("csrf-token")
        }
      }).then((response) => response.json())
    },

    delete: (url, options) => {
      return fetch(url, {
        ...options,
        method: "DELETE",
        headers: {
          "X-CSRF-Token": getMetaValue("csrf-token")
        }
      }).then((response) => response.json())
    }
  }
}

export const useFetch = (controller) => {
  Object.assign(controller, fetcher)
}
