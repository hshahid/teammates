<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<t:staticPage currentPage="contact">
    <h1 id="caption">
        Contact Us
    </h1>
    <img src="images/contact.png" width="125px" style="padding-left: 100px;">
    <div id="contentHolder">
        <p>
        <div class="container" style="width: 1000px; height:110px; margin: 0 auto">
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-xl2">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </p>
        <p>
            <br><br>
            <span class="bold">Blog: </span>Visit the <a href="http://teammatesonline.blogspot.sg/">TEAMMATES Blog</a> to see our latest updates and information.
        </p>
        <br>
        <p>
            <span class="bold">Bug reports and feature requests: </span> Any bug reports or feature requests can be submitted to above email address.
        </p>
        <br>
        <p>
            <span class="bold">Interested in joining us?: </span>Visit our <a href="https://github.com/TEAMMATES/teammates">Developer Website</a>.
        </p>
    </div>
    <script src="js/contact.js"></script>
</t:staticPage>
