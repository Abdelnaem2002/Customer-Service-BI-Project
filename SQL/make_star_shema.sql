-- Link to DimCustomer
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Customer
FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID);

-- Link to DimAgent
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Agent
FOREIGN KEY (AgentID) REFERENCES DimAgent(AgentID);

-- Link to DimIssueType
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_IssueType
FOREIGN KEY (IssueTypeID) REFERENCES DimIssueType(IssueTypeID);

-- Link to DimPriority
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Priority
FOREIGN KEY (PriorityID) REFERENCES DimPriority(PriorityID);

-- Link to DimStatus
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Status
FOREIGN KEY (StatusID) REFERENCES DimStatus(StatusID);

-- Link to DimChannel
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Channel
FOREIGN KEY (ChannelID) REFERENCES DimChannel(ChannelID);

-- Link to DimOrderStatus
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_OrderStatus
FOREIGN KEY (OrderStatusID) REFERENCES DimOrderStatus(OrderStatusID);

-- Link to DimSatisfaction
ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_Fact_Satisfaction
FOREIGN KEY (SatisfactionID) REFERENCES DimSatisfaction(SatisfactionID);
