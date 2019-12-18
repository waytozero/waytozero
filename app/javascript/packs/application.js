/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import "bootstrap";
import "../partials/challengeDone";
import {eventForm} from "../partials/form";
import {timeline} from "../partials/timeline.js";
import {count} from "../partials/count.js";
import initSlick from "plugins/init_slick";
import { timer } from "../partials/countdown";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { emailForm } from '../partials/emailForm.js';

eventForm();
timeline(document.querySelectorAll('.timeline'), {
      mode: 'horizontal',
      visibleItems: 6,
      forceVerticalWidth: 800
});

initSlick();
// initMapbox();
count('.plastic-counter');
count('.tree-counter');

timer()
