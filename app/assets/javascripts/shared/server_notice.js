// append dev server notice to body
document.addEventListener('DOMContentLoaded', function() {
	if (window.location.href.includes("dev.bambooapp")) {
		let notice = document.createElement("div");
		let notice_message = getNoticeMessage($('body').data('locale'));
		notice.innerHTML = `
			<div class="">
			<div class="close--wrapper" title="Zatvori">
				<!-- Created with Inkscape (http://www.inkscape.org/) -->
				<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" width="256" height="256" viewBox="0 0 256 256" id="svg4410" version="1.1" inkscape:version="0.91 r13725" sodipodi:docname="mobile_x.svg">
				  <defs id="defs4412"></defs>
				  <sodipodi:namedview id="base" pagecolor="#ffffff" bordercolor="#666666" borderopacity="1.0" inkscape:pageopacity="0.0" inkscape:pageshadow="2" inkscape:zoom="1.4" inkscape:cx="148.20879" inkscape:cy="128.54996" inkscape:document-units="px" inkscape:current-layer="layer1" showgrid="false" units="px" inkscape:window-width="1366" inkscape:window-height="708" inkscape:window-x="-13" inkscape:window-y="-13" inkscape:window-maximized="1"></sodipodi:namedview>
				  <metadata id="metadata4415">
				    <rdf:rdf>
				      <cc:work rdf:about="">
				        <dc:format>image/svg+xml</dc:format>
				        <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"></dc:type>
				        <dc:title></dc:title>
				      </cc:work>
				    </rdf:rdf>
				  </metadata>
				  <g inkscape:label="Layer 1" inkscape:groupmode="layer" id="layer1" transform="translate(0,-796.36216)">
				    <rect rx="10.577449" y="547.10724" x="616.13239" height="32.011692" width="256" id="rect4192" style="opacity:1;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" transform="matrix(0.70710678,0.70710678,-0.70710678,0.70710678,0,0)"></rect>
				    <rect rx="10.577449" style="opacity:1;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect4194" width="256" height="32.011692" x="-691.1131" y="728.12659" transform="matrix(0.70710678,-0.70710678,0.70710678,0.70710678,0,0)"></rect>
				  </g>
				</svg>
			</div>
			<p>${notice_message}</p>
			</div>
		`;
		notice.classList.add("dev-server-notice");
		document.querySelector("body").appendChild(notice);
		setTimeout(function(){
			$('.dev-server-notice').addClass('float-up');
		}, 1000)
	}
})

$(document).on('click', '.close--wrapper', function(){
	$('.dev-server-notice').removeClass('float-up');
});

function getNoticeMessage(locale='en'){
	if(locale === 'hr'){
		return 'Razvojni/testni server - ovaj server koristi se samo za testiranje.';
	}
	if(locale === 'en'){
		return 'Development server - for development and testing purposes only.';
	}
}