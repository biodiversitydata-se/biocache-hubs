<asset:script type="text/javascript">
    var BC_CONF = BC_CONF || {};
    BC_CONF.contextPath = "${request.contextPath}";
    BC_CONF.locale = "${(org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString())?:request.locale}";
</asset:script>