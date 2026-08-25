%% ========================================================================
%  Script: Plot Tracking Errors for Different Noise Levels
%  ========================================================================
%  DESCRIPTION:
%    This script generates a 3-panel figure comparing the tracking errors
%    (e1, e2, e3) under three different process noise levels (w_l).
%
%  DEPENDENCIES:
%    Before running, ensure the following 3x501 matrices exist in the 
%    MATLAB workspace ('error_data.mat'):
%      - e   : 3x501 matrix, tracking error under noise level w_l = 1
%      - e01 : 3x501 matrix, tracking error under noise level w_l = 0.1
%      - e00 : 3x501 matrix, tracking error under noise level w_l = 0
%    Each matrix row corresponds to: [e1; e2; e3].
%
%  FIGURE STRUCTURE:
%    - Panel 1 (top)    : e1 tracking error.
%    - Panel 2 (middle) : e2 tracking error.
%    - Panel 3 (bottom) : e3 tracking error.
%    - Each panel includes a zoomed inset focusing on the steady-state 
%      region (k = 400 to 500), highlighted by a rectangle and dashed 
%      guide lines.
%  ========================================================================

Tk = 500;
k = 1:Tk;

% =========================================================================
% Subplot 1: Tracking error e1 (Channel 1)
% =========================================================================
subplot(3, 1, 1);
plot(0:Tk, e(1,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(1,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(1,:), 'b-', 'LineWidth', 1);

% Highlight the steady-state region (k=400 to 500) with a rectangle
rectangle('position', [400, -0.05, 100, 0.1]);
line([240, 400], [0.32, -0.05], 'LineStyle', '--');
line([490, 500], [1.08, 0.05], 'LineStyle', '--');

ylim([-0.3, 1.2]);
ylabel('$e_1(k)$', 'Interpreter', 'latex');
hold off;

% Inset plot: zoomed-in view of the steady-state region (k=400 to 500)
insetPosition = [0.5, 0.8, 0.39, 0.11];
axes('position', insetPosition);
plot(0:Tk, e(1,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(1,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(1,:), 'b-', 'LineWidth', 1);
xlim([400, 500]);
ylim([-0.05, 0.05]);
hold off;

% =========================================================================
% Subplot 2: Tracking error e2 (Channel 2)
% =========================================================================
subplot(3, 1, 2);
plot(0:Tk, e(2,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(2,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(2,:), 'b-', 'LineWidth', 1);

% Highlight the steady-state region (k=400 to 500) with a rectangle
rectangle('position', [400, -1, 100, 2]);
line([240, 400], [7.2, -1], 'LineStyle', '--');
line([490, 500], [22.8, 1], 'LineStyle', '--');

ylim([-5, 25]);
ylabel('$e_2(k)$', 'Interpreter', 'latex');
hold off;

% Inset plot: zoomed-in view of the steady-state region (k=400 to 500)
insetPosition = [0.5, 0.5, 0.39, 0.11];
axes('position', insetPosition);
plot(0:Tk, e(2,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(2,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(2,:), 'b-', 'LineWidth', 1);
xlim([400, 500]);
ylim([-1, 1]);
hold off;

% =========================================================================
% Subplot 3: Tracking error e3 (Channel 3)
% =========================================================================
subplot(3, 1, 3);
plot(0:Tk, e(3,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(3,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(3,:), 'b-', 'LineWidth', 1);

% Highlight the steady-state region (k=400 to 500) with a rectangle
rectangle('position', [400, -0.05, 100, 0.1]);
line([240, 400], [0.42, -0.05], 'LineStyle', '--');
line([490, 500], [1.18, 0.05], 'LineStyle', '--');

ylim([-0.2, 1.3]);
ylabel('$e_3(k)$', 'Interpreter', 'latex');
xlabel('$k$', 'Interpreter', 'latex');
hold off;

% Inset plot: zoomed-in view of the steady-state region (k=400 to 500)
insetPosition = [0.5, 0.2, 0.39, 0.11];
axes('position', insetPosition);
plot(0:Tk, e(3,:), 'Color', [0, 0.8, 0], 'LineWidth', 1);
hold on;
plot(0:Tk, e01(3,:), 'r-', 'LineWidth', 1);
plot(0:Tk, e00(3,:), 'b-', 'LineWidth', 1);
xlim([400, 500]);
ylim([-0.05, 0.05]);
hold off;

% Global legend for all three subplots
legend('$w_l=1$', '$w_l=0.1$', '$w_l=0$', 'Interpreter', 'latex');