function res = overlap(l1, t1, w1, h1, l2, t2, w2, h2)
                p1 = [l1, t1];
                p2 = [l1 + w1, t1 - h1];
                p3 = [l2, t2];
                p4 = [l2 + w2, t2 - h2];
                
                xd1 = min(p1(1), p2(1));
                yd1 = min(p1(2), p2(2));
                xf1 = max(p1(1), p2(1));
                yf1 = max(p1(2), p2(2));
                
                xd2 = min(p3(1), p4(1));
                yd2 = min(p3(2), p4(2));
                xf2 = max(p3(1), p4(1));
                yf2 = max(p3(1), p4(2));
                
                dx = max(0, min(xf1 - xd2, xf2 - xd1));
                dy = max(0, min(yf1 - yd2, yf2 - yd1));
                
                %
                %disp(dx * dy);
                
                res = (dx * dy > 0);
end