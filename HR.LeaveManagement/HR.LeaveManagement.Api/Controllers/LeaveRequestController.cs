using HR.LeaveManagement.Application.DTOs.LeaveRequest;
using HR.LeaveManagement.Application.Features.LeaveRequests.Requests;
using HR.LeaveManagement.Application.Features.LeaveRequests.Requests.Commands;
using HR.LeaveManagement.Domain;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HR.LeaveManagement.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LeaveRequestController : ControllerBase
    {
        private readonly IMediator _mediator;

        public LeaveRequestController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        public async Task<ActionResult<List<LeaveRequest>>> GetAll()
        {
            var leaveTypes = await _mediator.Send(new GetLeaveRequestListQuery());
            return Ok(leaveTypes);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<LeaveRequestDto>> Get(int id)
        {
            var leaveType = await _mediator.Send(new GetLeaveRequestDetailQuery { Id = id });
            return Ok(leaveType);
        }

        [HttpPost]
        public async Task<ActionResult<int>> Post([FromBody] CreateLeaveRequestDto leaveRequest)
        {
            var command = new CreateLeaveRequestCommand { LeaveRequestDto = leaveRequest };
            var response = await _mediator.Send(command);
            return Ok(response);
        }


        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id,[FromBody] UpdateLeaveRequestDto leaveRequest)
        {
            var command = new UpdateLeaveRequestCommand {Id=id, LeaveRequestDto = leaveRequest };
            await _mediator.Send(command);
            return NoContent();
        }

        [HttpPut("changeApproval")]
        public async Task<ActionResult> Put( [FromBody] ChangeLeaveRequestApprovalDto changeLeaveRequestApprovalDto)
        {
            var command = new UpdateLeaveRequestCommand { ChangeLeaveRequestApprovalDto = changeLeaveRequestApprovalDto };
            await _mediator.Send(command);
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var command = new DeleteLeaveRequestCommand { Id = id };
            await _mediator.Send(command);
            return NoContent();
        }
    }
}
