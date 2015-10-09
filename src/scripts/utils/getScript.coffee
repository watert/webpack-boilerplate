module.exports = (source)->
    tag = document.createElement("script")
    tag.type = "text/javascript"
    tag.src=source
    document.getElementsByTagName("head")[0].appendChild(tag)
    return tag
