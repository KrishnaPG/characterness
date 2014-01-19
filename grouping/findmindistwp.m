function minIndex = findmindistwp(index,cIndex,dist,distIndex,skelLength,area,flag,orientation,...
    textLength,bBox,slope)
minIndex = [];
if slope==-1
    for i = 1:length(skelLength)
        if dist(i)<(skelLength(index)+skelLength(distIndex(i)))/(2.5) && flag(distIndex(i))==0
            if (area(index)/area(distIndex(i)))<3 && (area(index)/area(distIndex(i)))>0.4
            minIndex = cIndex(distIndex(i));
            return;
            end
        end
    end
else
    for i = 1:length(skelLength)
       if textLength<=4
        if abs(bBox(distIndex(i),1)-bBox(index,2))<=4*textLength && flag(distIndex(i))==0
            if abs(orientation(cIndex(index),cIndex(distIndex(i)))-slope)<30 &&...
               (area(index)/area(distIndex(i)))<4 && (area(index)/area(distIndex(i)))>0.25
            minIndex = cIndex(distIndex(i));
            return;
            end
        end
       else
        if abs(bBox(distIndex(i),1)-bBox(index,2))<2.5*textLength && flag(distIndex(i))==0
            if abs(orientation(cIndex(index),cIndex(distIndex(i)))-slope)<30 &&...
               (area(index)/area(distIndex(i)))<4 && (area(index)/area(distIndex(i)))>0.25
            minIndex = cIndex(distIndex(i));
            return;
            end
        end
       end
    end
end