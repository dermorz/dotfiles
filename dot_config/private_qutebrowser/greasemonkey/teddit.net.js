// ==UserScript==
// @name               Teddit
// @namespace          https://greasyfork.org/en/users/728780-turbo-cafe-clovermail-net
// @description        Always redirects to teddit.net.
// @include            *://*.reddit.com/*
// @exclude            *://*.reddit.com/poll/*
// @version            1.01
// @run-at             document-start
// @author             turbo.cafe@clovermail.net
// @grant              none
// @icon               https://teddit.net/favicon.png
// ==/UserScript==
 
window.location.replace("https://teddit.net" + window.location.pathname + window.location.search);
