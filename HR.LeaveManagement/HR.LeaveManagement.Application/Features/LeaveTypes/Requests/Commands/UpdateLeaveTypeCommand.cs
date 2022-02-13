﻿using HR.LeaveManagement.Application.DTOs.LeaveRequest;
using HR.LeaveManagement.Application.DTOs.LeaveType;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HR.LeaveManagement.Application.Features.LeaveTypes.Requests.Commands
{
  public  class UpdateLeaveTypeCommand:IRequest<Unit>
    {

        public LeaveTypeDto LeaveTypeDto { get; set; }
        
    }
}
