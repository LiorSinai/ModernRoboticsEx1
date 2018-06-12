% plotH3(H,label,f,length) - plot H in the 3-d plot in figure f
% A frame with text "label" will be drawn at H
% "length" is the length of the x,y,z-vectors.
function plotH3(H,label,f,length,width)
    figure(f);
    
    % hack for airfame display: rotate around x by 180° first..
    Hr = homogeneous(rodriguez(1,pi),[0 0 0]');
    H = Hr * H;
    
    p0 = H(1:4,4);
    px = H*[length 0 0 1]';
    py = H*[0 length 0 1]';
    pz = H*[0 0 length 1]';
    
    plot3(p0(1),p0(2),p0(3),'*k');
    line([p0(1) px(1)],[p0(2) px(2)],[p0(3) px(3)],'Color','red','LineWidth',width)
    line([p0(1) py(1)],[p0(2) py(2)],[p0(3) py(3)],'Color','green','LineWidth',width)
    line([p0(1) pz(1)],[p0(2) pz(2)],[p0(3) pz(3)],'Color','blue','LineWidth',width)
    
    label_distance_factor = 0.3;
    text(p0(1)-length*label_distance_factor,p0(2)-length*label_distance_factor,p0(3)-length*label_distance_factor,label);
    
end