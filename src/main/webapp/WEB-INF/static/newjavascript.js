            <%@page contentType="text/javascript" pageEncoding="UTF-8"%>
            let cat = document.getElementById("category");
            let mat = document.getElementById("material");
            let size = document.getElementById("size");
            cat.addEventListener("onkeyup", handleKeyUp);
            
            function handleKeyUp(event){
                if (cat.value === "cup"){
                    console.log(cat.value);
                    mat.innerHTML = '<form:option value="bamboo">Bamboo</form:option><form:option value="steel">Steel</form:option><form:option value="hard paper">Hard paper</form:option>';
                    size.innerHtml = '<form:option value="0.5L">0.5L</form:option><form:option value="0.75L">0.75L</form:option><form:option value="1L">1L</form:option>';
                } else if (cat.value === "straw"){
                    console.log(cat.value);
                    mat.innerHTML = '<form:option value="bamboo">Bamboo</form:option><form:option value="steel">Steel</form:option>';
                    size.innerHTML = '<form:option value="3 inches">3 inches</form:option><form:option value="5 inches">5 inches</form:option><form:option value="7 inches">7 inches</form:option>';
                } else {
                    console.log(cat.value);
                    mat.innerHTML = '<form:option value="bamboo">Bamboo</form:option><form:option value="wood">Wood</form:option>';
                    size.innerHTML = '<form:option value="kid">kids</form:option><form:option value="adult">adult</form:option>';
                }
            }


