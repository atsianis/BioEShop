<c:if test="${loggedinuser != 'anonymousUser'}">
    <span>Dear <strong>${loggedinuser}</strong>, welcome.</span>
</c:if>
<c:if test="${loggedinuser == 'anonymousUser'}">
    <span>Sign up and get exclusive offers!</span>
</c:if>