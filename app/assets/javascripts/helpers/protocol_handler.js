// @license magnet:?xt=urn:btih:0b31508aeb0634b347b8270c7bee4d411b5d4109&dn=agpl-3.0.txt AGPL-v3-or-Later

Diaspora.ProtocolHandler = {
  register: function() {
    if (!window.navigator.registerProtocolHandler) {
      return false;
    }

    try {
      window.navigator.registerProtocolHandler(
        "web+diaspora",
        [window.location.protocol, "//", window.location.host, "/link?q=%s"].join(""),
        document.title
      );
    } catch (_) {
      return false;
    }

    return true;
  }
};
