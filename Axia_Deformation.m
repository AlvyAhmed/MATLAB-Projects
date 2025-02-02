% Parameters
L = 1.0;           % Length of the bar (meters)
Nx = 100;          % Number of elements
E = 2.1e11;        % Young's Modulus (Pa)
A = 0.001;         % Cross-sectional Area (m^2)
F = 1000;          % Applied axial force (Nm)

% Element properties
elementLength = L / Nx; % Length of each element
elementNodes = 2;      % Number of nodes per element (2 for linear elements)

% Node coordinatesx = linspace(0, L, Nx + 1);

% Initialize stiffness matrix and force vector
K_global = zeros(Nx + 1, Nx + 1);
F_global = zeros(Nx + 1, 1);

% Assembly of stiffness matrix and force vector
for e = 1:Nx
    % Element stiffness matrix
    ke = (E * A / elementLength) * [1, -1; -1, 1];
    
    % Element force vector
    fe = (F * elementLength / 2) * [1; 1];
    
    % Add element contributions to global matrix
    nodes = [e, e+1];
    K_global(nodes, nodes) = K_global(nodes, nodes) + ke;
    F_global(nodes) = F_global(nodes) + fe;
end

% Apply boundary conditions (fixed ends)
K_global(1, :) = 0;
K_global(1, 1) = 1;
F_global(1) = 0;

K_global(end, :) = 0;
K_global(end, end) = 1;
F_global(end) = 0;

% Solve for displacements
u = K_global \ F_global;

% Plot the deformation
plot(L, u)
xlabel('Position (m)')
ylabel('Deformation (m)')
title('Deformation')
grid on
