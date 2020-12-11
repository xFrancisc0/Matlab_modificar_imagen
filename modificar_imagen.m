%1) Leer rgb
img_rgb = imread('Foto-antigua-03.jpg');
%2) Se desean borrar los quiebres. Ponemos el valor en 3 ya que mucho valor
%quita calidad y poco valor no borra tanto los quiebres.
se = strel('disk',3);
%3) Erosionamos la imagen con se
imgErode = imerode(img_rgb,se);
%4) La reconstruimos
imgRec = imreconstruct(imgErode,img_rgb);
%5) Aplicamos apertura morfologica( (imgReconst Erosion se) dilatacion se )
imgOpenMorf = imopen(imgRec,se);
imwrite(imgOpenMorf, 'imreconstruct.jpg');


%6) Plotear todo en una misma ventana
%--------------------------------
[X1,map1]=imread('Foto-antigua-03.jpg');
[X2,map2]=imread('imreconstruct.jpg');
subplot(1,2,1), imshow(X1,map1)
title('Imagen original')
subplot(1,2,2), imshow(X2,map2)
title('Imagen reconstruida')