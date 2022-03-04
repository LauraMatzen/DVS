%%dvs() takes an image and outputs the Data Vis Saliency Model map
%%structure

%Calculates both the Itti saliency (modified from the original version 
%implemented in Harel's GBVS to use CIE LAB colorspace) and text saliency. 
%Creates and outputs a linear combination of the two (with 2x the weight 
%for text), giving the Data Vis Saliency map.

%For more information see Matzen, Haass, Divis, Wang & Wilson. (under
%review). Data Visualization Saliency Model: A tool for evaluating abstract
%data visualizations.

%Created 11.21.16 - K. Divis



function out = dvs(img)

if ( ischar(img) == 1 ) img = imread(img); end
if ( strcmp(class(img),'uint8') == 1 ) img = double(img)/255; end

w = 2;  %scale factor applied to text saliency map before adding to IttiKoch map

% compute Itti-Koch saliency map
    ikout = ittikochmap(img);
    ikmap = ikout.master_map_resized;
    
% compute text saliency
    S = textSaliency(img);

% make linear combinations (with text saliency given twice the weight)
    comb = (S*w+ikmap) ./ (w + 1); % weighted average to keep scaling from 0 to 1
    
% out = comb;
out = ikout;
out.master_map_resized = comb;  % put the visSal map in master_map_resized
out.map_types{end+1} = 'text';  % update may type cell arrary
out.top_level_feat_maps{end+1} = S; % put text saliency map into top_level_feat_maps
