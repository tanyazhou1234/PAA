function createfigure_goldberg(X1, Y1, Scale, Lgdtitle, Legend)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of plot x data
%  Y1:  vector of plot y data

%  Auto-generated by MATLAB on 06-Apr-2023 22:53:24

Xn = size(X1,1);
Yn = size(Y1,1);
newcolors = hsv(max(Xn,Yn));

% Create figure
fig_size = 12;
figure1 = figure('Units','centimeters','Position',[5 5 5+fig_size, 5+fig_size],'Name','Figure','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
lc = 0.5;
line([1e-2 1],[1e-2 1],'LineWidth',1,'Color',[lc lc lc],'HandleVisibility','off');
line([1 1],[1 1e2],'LineWidth',1,'Color',[lc lc lc],'HandleVisibility','off');
line([1 1e2],[1 1],'LineWidth',1,'Color',[lc lc lc],'HandleVisibility','off');
line([1e-2 1],[1 1],'LineWidth',2,'Color',[lc lc lc],'HandleVisibility','off');
line([1 1],[1e-2 1],'LineWidth',2,'Color',[lc lc lc],'HandleVisibility','off');
line([1 1e2],[1 1e2],'LineWidth',2,'Color',[lc lc lc],'HandleVisibility','off');

plot1 = plot(X1,Y1);
if nargin > 3
    for i=1:max(Xn,Yn)
        set(plot1(i),'DisplayName',Legend(i),'LineWidth',1.5,'Color',newcolors(i,:));
    end
else
    for i=1:max(Xn,Yn)
        set(plot1(i),'LineWidth',1.5,'Color',newcolors(i,:));
    end
end

if Scale == "linear"
    x_chi   = 2.95;
    y_chi   = 3.05;
    x_w     = 0.45;
    y_w     = 0.55;
    x_bm1   = 0.50;
    x_bm2   = 1.50;
    y_bm    = 3.50;
    x_1     = 0.25;
    y_1     = 0.75;
    y_2     = 2.50;
    x_3     = 1.50;
    y_4     = 1.00;
else
    x_chi   = 10^(2.95-2);
    y_chi   = 10^(3.05-2);
    x_w     = 10^(0.45-2);
    y_w     = 10^(0.55-2);
    x_bm1   = 10^(0.50-2);
    x_bm2   = 10^(1.50-1);
    y_bm    = 10^(3.50-2);
    x_1     = 10^(-1.50);
    y_1     = 10^(-0.50);
    y_2     = 10^(1.00);
    x_3     = 10^(0.50);
    y_4     = 10^(0);
end

text(x_chi, y_chi, '$\chi (=R_{\mathrm{F}}/R_{\mathrm{S}}) < 1$','Interpreter','latex','Rotation',45,'VerticalAlignment','bottom','HorizontalAlignment','center');
text(y_chi, x_chi, '$\chi (=R_{\mathrm{F}}/R_{\mathrm{S}}) > 1$','Interpreter','latex','Rotation',45,'VerticalAlignment','top','HorizontalAlignment','center');

text(x_w, y_w, '$R_{\mathrm{S}} > R_{\mathrm{F}} > R_{\mathrm{A}}$','Interpreter','latex','Rotation',45,'VerticalAlignment','bottom','HorizontalAlignment','center');
text(y_w, x_w, '$R_{\mathrm{F}} > R_{\mathrm{S}} > R_{\mathrm{A}}$','Interpreter','latex','Rotation',45,'VerticalAlignment','top','HorizontalAlignment','center');

text(x_bm1, y_bm, '$R_{\mathrm{S}} > R_{\mathrm{A}} > R_{\mathrm{F}}$','Interpreter','latex','HorizontalAlignment','center');
text(x_bm2, y_bm, '$R_{\mathrm{A}} > R_{\mathrm{S}} > R_{\mathrm{F}}$','Interpreter','latex','HorizontalAlignment','center');

text(y_bm, x_bm1, '$R_{\mathrm{F}} > R_{\mathrm{A}} > R_{\mathrm{S}}$','Interpreter','latex','HorizontalAlignment','center');
text(y_bm, x_bm2, '$R_{\mathrm{A}} > R_{\mathrm{F}} > R_{\mathrm{S}}$','Interpreter','latex','HorizontalAlignment','center');

text(x_1, y_1, '(1)', ...
    'Interpreter','latex','HorizontalAlignment','center','FontSize',11);
text(x_1, y_2, '(2)', ...
    'Interpreter','latex','HorizontalAlignment','center','FontSize',11);
text(x_3, y_2, '(3)', ...
    'Interpreter','latex','HorizontalAlignment','center','FontSize',11);
text(y_2, y_4, '(4)', ...
    'Interpreter','latex','HorizontalAlignment','center','FontSize',11);

% text(x_1, y_1, {'(1) Small-signal', 'absorption limiting','in the collimated zone'}, ...
%     'Interpreter','latex','VerticalAlignment','top');
% text(x_1, y_2, {'(2) Absorption', 'limiting in the', 'far spherical zone'}, ...
%     'Interpreter','latex','VerticalAlignment','middle');
% text(x_3, y_2, {'(3) Saturation limiting', 'in the far spherical zone','(but small-signal absorption', 'limits the array length)'}, ...
%     'Interpreter','latex','HorizontalAlignment','left');
% text(y_2, y_4, {'(4) Saturation limiting', 'in the collimated zone'}, ...
%     'Interpreter','latex','HorizontalAlignment','center');

% Create ylabel
ylabel('$Y(=1/\alpha R_\mathrm{F}=R_\mathrm{A}/R_\mathrm{F})$','Interpreter','latex');

% Create xlabel
xlabel('$X(=\Gamma=R_\mathrm{A}/R_\mathrm{S})$','Interpreter','latex');

if Scale == "linear"
% Uncomment the following line to preserve the X-limits of the axes
    xlim(axes1,[0 4]);
% Uncomment the following line to preserve the Y-limits of the axes
    ylim(axes1,[0 4]);
else
    xlim(axes1,[1e-2 1e2]);
    ylim(axes1,[1e-2 1e2]);
end

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',11,'XGrid','on','YGrid',...
    'on','Xscale',Scale,'Yscale',Scale);
% Create legend
if nargin > 3
    legend1 = legend(axes1,'show');
    set(legend1,'Location','north','Orientation','horizontal');
    title(legend1, Lgdtitle, 'Interpreter','latex');
end
