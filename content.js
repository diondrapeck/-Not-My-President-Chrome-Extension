// Replace all instances of his name with "Not My President"
var elements = document.getElementsByTagName('*');

for (var i = 0; i < elements.length; i++) {
    var element = elements[i];

    for (var j = 0; j < element.childNodes.length; j++) {
        var node = element.childNodes[j];

        if (node.nodeType === 3) {
            var text = node.nodeValue;
	    var re = /Trump|Donald Trump|Donald J. Trump|Donald John Trump|President Trump|President Donald Trump|President Donald J. Trump/g;
            var replacedText = text.replace(re, "Not My President");
		
            if (replacedText !== text) {
                element.replaceChild(document.createTextNode(replacedText), node);
            }
        }
    }
}


