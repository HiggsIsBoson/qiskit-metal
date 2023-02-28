
from qiskit_metal.qlibrary.tlines.meandered import RouteMeander

from qiskit_metal.qlibrary.tlines.pathfinder import RoutePathfinder

from qiskit_metal.qlibrary.terminations.open_to_ground import OpenToGround

from qiskit_metal.qlibrary.terminations.launchpad_wb_driven import LaunchpadWirebondDriven

from qiskit_metal import designs, MetalGUI

design = designs.DesignPlanar()

gui = MetalGUI(design)


LP1 = LaunchpadWirebondDriven(
design,
name='LP1',
options={'lead_length': '30um',
 'orientation': '360',
 'pos_x': '-1.5mm',
 'pos_y': '2.0mm'},

component_template=None,
)




LP2 = LaunchpadWirebondDriven(
design,
name='LP2',
options={'lead_length': '30um',
 'orientation': '180',
 'pos_x': '1.5mm',
 'pos_y': '2.0mm'},

component_template=None,
)




TL_LP1_LP2 = RoutePathfinder(
design,
name='TL_LP1_LP2',
options={'_actual_length': '2.94 mm',
 'fillet': '99um',
 'hfss_wire_bonds': True,
 'lead': {'end_jogged_extension': '',
          'end_straight': '1.972mm',
          'start_jogged_extension': '',
          'start_straight': '0mm'},
 'pin_inputs': {'end_pin': {'component': 'LP2',
                            'pin': 'tie'},
                'start_pin': {'component': 'LP1',
                              'pin': 'tie'}},
 'trace_gap': '9um',
 'trace_width': '15um'},

type='CPW',
)




otg1s = OpenToGround(
design,
name='otg1s',
options={'orientation': '180',
 'pos_x': '-0.3mm',
 'pos_y': '1.968mm'},

component_template=None,
)




otg1e = OpenToGround(
design,
name='otg1e',
options={'orientation': '270',
 'pos_x': '0.0mm',
 'pos_y': '0.0mm'},

component_template=None,
)




meander = RouteMeander(
design,
name='meander',
options={'_actual_length': '8.0 mm',
 'fillet': '99 um',
 'hfss_wire_bonds': True,
 'lead': {'end_jogged_extension': '',
          'end_straight': '0mm',
          'start_jogged_extension': '',
          'start_straight': '250um'},
 'pin_inputs': {'end_pin': {'component': 'otg1e',
                            'pin': 'open'},
                'start_pin': {'component': 'otg1s',
                              'pin': 'open'}},
 'total_length': '8.0mm',
 'trace_gap': '5um',
 'trace_width': '12um'},

type='CPW',
)



gui.rebuild()
gui.autoscale()
        