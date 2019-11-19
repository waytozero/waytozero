import "bootstrap";
import "../partials/challengeDone";
import {eventForm} from "../partials/form";
import {timeline} from "../partials/timeline.js";
import {count} from "../partials/count.js";
import 'mapbox-gl/dist/mapbox-gl.css'
import { initMapbox } from '../plugins/init_mapbox';
eventForm();
timeline(document.querySelectorAll('.timeline'), {
     mode: 'horizontal',
     visibleItems: 6,
     forceVerticalWidth: 800
 });
initMapbox();
count('.plastic-counter');
count('.tree-counter');
