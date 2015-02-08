#include "sink.h"

void sink::sink_method ( )
{
  cout << "Packet written " << sc_time_stamp() << endl ;
  cout << p_in.read() << endl ;
  cout << "fill count " << sc_time_stamp() << endl ;
  cout << p_count_in.read() << endl ;
}

