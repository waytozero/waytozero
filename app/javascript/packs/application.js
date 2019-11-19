import "bootstrap";
import {eventForm} from "../partials/form";
import {timeline} from "../partials/timeline.js";
import {count} from "../partials/count.js";
eventForm();

console.log(timeline)
timeline(document.querySelectorAll('.timeline'), {
     mode: 'horizontal',
     visibleItems: 6,
     forceVerticalWidth: 800
 });
count('.plastic-counter');
count('.tree-counter');


