//	HYPE.documents["splashVilla5"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = ".";
	var documentName = "splashVilla5";
	var documentLoaderFilename = "splashvilla5_hype_generated_script.js";

	// find the URL for this script's absolute path and set as the resourceFolderName
	try {
		var scripts = document.getElementsByTagName('script');
		for(var i = 0; i < scripts.length; i++) {
			var scriptSrc = scripts[i].src;
			if(scriptSrc != null && scriptSrc.indexOf(documentLoaderFilename) != -1) {
				resourcesFolderName = scriptSrc.substr(0, scriptSrc.lastIndexOf("/"));
				break;
			}
		}
	} catch(err) {	}

	// Legacy support
	if (typeof window.HYPE_DocumentsToLoad == "undefined") {
		window.HYPE_DocumentsToLoad = new Array();
	}
 
	// load HYPE.js if it hasn't been loaded yet
	if(typeof HYPE_108 == "undefined") {
		if(typeof window.HYPE_108_DocumentsToLoad == "undefined") {
			window.HYPE_108_DocumentsToLoad = new Array();
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);

			var headElement = document.getElementsByTagName('head')[0];
			var scriptElement = document.createElement('script');
			scriptElement.type= 'text/javascript';
			scriptElement.src = resourcesFolderName + '/' + 'HYPE.js?hype_version=108';
			headElement.appendChild(scriptElement);
		} else {
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);
		}
		return;
	}
	
	// guard against loading multiple times
	if(HYPE.documents[documentName] != null) {
		return;
	}
	
	var hypeDoc = new HYPE_108();
	
	var attributeTransformerMapping = {b:"i",c:"i",bC:"i",d:"i",aS:"i",M:"i",e:"f",N:"i",f:"d",aT:"i",O:"i",g:"c",aU:"i",P:"i",Q:"i",aV:"i",R:"c",aW:"f",aI:"i",S:"i",T:"i",l:"d",aX:"i",aJ:"i",m:"c",n:"c",aK:"i",X:"i",aL:"i",A:"c",aZ:"i",Y:"i",B:"c",C:"c",D:"c",t:"i",E:"i",G:"c",bA:"c",a:"i",bB:"i"};

var scenes = [{initialValues:{"42":{o:"content-box",h:"logo_allapps_into.png",x:"visible",a:96,q:"100% 100%",b:308,j:"absolute",r:"inline",c:128,z:"10",k:"div",d:103,e:"0.000000"},"41":{o:"content-box",w:"",h:"bg_into.jpg",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",r:"inline",c:320,z:"8",k:"div",d:548},"39":{o:"content-box",Q:0,h:"splashC.png",x:"visible",R:"#000000",q:"100% 100%",b:0,S:0,r:"none",z:"9",T:0,j:"absolute",d:480,c:320,a:0,e:"0.000000",aW:"0.000000",aX:8,k:"div"},"43":{o:"content-box",h:"logo_villa_into.png",x:"visible",a:76,q:"100% 100%",b:-167,j:"absolute",r:"inline",c:179,z:"11",k:"div",d:145,e:"1.000000"}},timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[{f:"2",t:0,d:3,i:"e",e:"0.702797",r:1,s:"0.000000",o:"42"},{f:"2",t:0,d:2,i:"e",e:"1.000000",r:1,s:"0.000000",o:"39"},{f:"2",t:0,d:2,i:"e",e:"1.231607",r:1,s:"1.000000",o:"43"},{f:"2",t:0,d:2,i:"b",e:122,r:1,s:-167,o:"43"}],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:3}},sceneIndex:0,perspective:"600px",oid:"1",onSceneAnimationCompleteAction:{type:0},backgroundColor:"#000000",name:"Untitled Scene"}];


	
	var javascripts = [];


	
	var Custom = {};
	var javascriptMapping = {};
	for(var i = 0; i < javascripts.length; i++) {
		try {
			javascriptMapping[javascripts[i].identifier] = javascripts[i].name;
			eval("Custom." + javascripts[i].name + " = " + javascripts[i].source);
		} catch (e) {
			hypeDoc.log(e);
			Custom[javascripts[i].name] = (function () {});
		}
	}
	
	hypeDoc.setAttributeTransformerMapping(attributeTransformerMapping);
	hypeDoc.setScenes(scenes);
	hypeDoc.setJavascriptMapping(javascriptMapping);
	hypeDoc.Custom = Custom;
	hypeDoc.setCurrentSceneIndex(0);
	hypeDoc.setMainContentContainerID("splashvilla5_hype_container");
	hypeDoc.setResourcesFolderName(resourcesFolderName);
	hypeDoc.setShowHypeBuiltWatermark(0);
	hypeDoc.setShowLoadingPage(false);
	hypeDoc.setDrawSceneBackgrounds(true);
	hypeDoc.setDocumentName(documentName);

	HYPE.documents[documentName] = hypeDoc.API;

	hypeDoc.documentLoad(this.body);
}());

