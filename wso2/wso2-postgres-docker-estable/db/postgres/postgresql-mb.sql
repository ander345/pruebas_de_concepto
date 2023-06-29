-- Copyright (c) 2015, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.

-- WSO2 Inc. licenses this file to you under the Apache License,
-- Version 2.0 (the "License"); you may not use this file except
-- in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

-- WSO2 Message Broker Oracle Database schema --

-- Start of Message Store Tables --

CREATE DATABASE "WSO2_MB_STORE_DB";
\c WSO2_MB_STORE_DB;

CREATE TABLE MB_QUEUE_MAPPING (
    QUEUE_ID SERIAL,
    QUEUE_NAME VARCHAR(512) UNIQUE NOT NULL,
    CONSTRAINT PK_MB_QUEUE_MAPPING PRIMARY KEY (QUEUE_ID)
);
    

CREATE TABLE MB_METADATA (
    MESSAGE_ID NUMERIC(19),
    QUEUE_ID INT,
    DLC_QUEUE_ID INT NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_METADATA PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_METADATA_QUEUE_MAPPING FOREIGN KEY (QUEUE_ID) REFERENCES MB_QUEUE_MAPPING (QUEUE_ID)
);

CREATE INDEX MB_METADATA_QUEUE_ID_INDEX ON MB_METADATA (QUEUE_ID);

CREATE TABLE MB_CONTENT (
    MESSAGE_ID NUMERIC(19),
    CONTENT_OFFSET INT,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT pk_messages PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_CONTENT FOREIGN KEY (MESSAGE_ID) REFERENCES MB_METADATA
    ON DELETE CASCADE
);

CREATE TABLE MB_EXPIRATION_DATA (
    MESSAGE_ID NUMERIC(19) UNIQUE,
    EXPIRATION_TIME NUMERIC(19),
    DLC_QUEUE_ID INT NOT NULL,
    MESSAGE_DESTINATION VARCHAR(512) NOT NULL,
    CONSTRAINT FK_EXPIRATION_DATA FOREIGN KEY (MESSAGE_ID) REFERENCES MB_METADATA (MESSAGE_ID)
    ON DELETE CASCADE
);

CREATE TABLE MB_RETAINED_METADATA (
    TOPIC_ID INT,
    TOPIC_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_RETAINED_METADATA PRIMARY KEY (TOPIC_ID)
);

CREATE TABLE IF NOT EXISTS MB_DTX_XID (
    INTERNAL_XID NUMERIC(19) UNIQUE NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    FORMAT_CODE NUMERIC(19) NOT NULL,
    GLOBAL_ID BYTEA, -- AMQP-10 vbin8 type
    BRANCH_ID BYTEA, -- AMQP-10 vbin8 type
    CONSTRAINT PK_MB_DTX_XID PRIMARY KEY (INTERNAL_XID, NODE_ID)
);

CREATE TABLE IF NOT EXISTS MB_DTX_ENQUEUE_RECORD (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) UNIQUE NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_ENQUEUE_RECORD PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_DTX_ENQUEUE_RECORD FOREIGN KEY (INTERNAL_XID)
    REFERENCES MB_DTX_XID (INTERNAL_XID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_DEQUEUE_RECORD (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_DEQUEUE_RECORD PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_DTX_DEQUEUE_RECORD FOREIGN KEY (INTERNAL_XID)
    REFERENCES MB_DTX_XID (INTERNAL_XID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_ENQUEUE_CONTENT (
    MESSAGE_ID NUMERIC(19) NOT NULL,
    INTERNAL_XID NUMERIC(19) NOT NULL,
    CONTENT_OFFSET INT NOT NULL,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_ENQUEUE_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_MB_DTX_ENQUEUE_CONTENT FOREIGN KEY (MESSAGE_ID)
    REFERENCES MB_DTX_ENQUEUE_RECORD (MESSAGE_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_DEQUEUE_CONTENT (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONTENT_OFFSET INT NOT NULL,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_DEQUEUE_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_MB_DTX_DEQUEUE_CONTENT FOREIGN KEY (MESSAGE_ID)
    REFERENCES MB_DTX_DEQUEUE_RECORD (MESSAGE_ID) ON DELETE CASCADE
);

-- End of Message Store Tables --

-- Start of Andes Context Store Tables --


CREATE TABLE MB_DURABLE_SUBSCRIPTION (
    SUBSCRIPTION_ID VARCHAR(512) NOT NULL, 
    DESTINATION_IDENTIFIER VARCHAR(512) NOT NULL,
    SUBSCRIPTION_DATA VARCHAR(2048) NOT NULL
);

CREATE TABLE MB_NODE (
    NODE_ID VARCHAR(512) NOT NULL,
    NODE_DATA VARCHAR(2048) NOT NULL,
        CONSTRAINT PK_MB_NODE PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_EXCHANGE (
    EXCHANGE_NAME VARCHAR(512) NOT NULL,
    EXCHANGE_DATA VARCHAR(2048) NOT NULL,
    CONSTRAINT PK_MB_EXCHANGE PRIMARY KEY (EXCHANGE_NAME)
);

CREATE TABLE MB_QUEUE (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    QUEUE_DATA VARCHAR(2048) NOT NULL,
    CONSTRAINT PK_MB_QUEUE PRIMARY KEY (QUEUE_NAME)
);

CREATE TABLE MB_BINDING (
    EXCHANGE_NAME VARCHAR(512) NOT NULL,
    QUEUE_NAME VARCHAR(512) NOT NULL,
    BINDING_DETAILS VARCHAR(2048) NOT NULL,
    CONSTRAINT FK_MB_BINDING_EXCHANGE FOREIGN KEY (EXCHANGE_NAME) REFERENCES MB_EXCHANGE (EXCHANGE_NAME),
    CONSTRAINT FK_MB_BINDING_QUEUE FOREIGN KEY (QUEUE_NAME) REFERENCES MB_QUEUE (QUEUE_NAME)
    ON DELETE CASCADE
);

CREATE TABLE MB_QUEUE_COUNTER (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_COUNT NUMERIC(19), 
    CONSTRAINT PK_QUEUE_COUNTER PRIMARY KEY (QUEUE_NAME) 
);

CREATE TABLE MB_SLOT (
    SLOT_ID BIGSERIAL NOT NULL,
    START_MESSAGE_ID NUMERIC(19) NOT NULL,
    END_MESSAGE_ID NUMERIC(19) NOT NULL,
    STORAGE_QUEUE_NAME VARCHAR(512) NOT NULL,
    SLOT_STATE NUMERIC(3) NOT NULL,
    ASSIGNED_NODE_ID VARCHAR(512),
    ASSIGNED_QUEUE_NAME VARCHAR(512),
    CONSTRAINT PK_MB_SLOT PRIMARY KEY (SLOT_ID)
);

CREATE INDEX MB_SLOT_MESSAGE_ID_INDEX ON MB_SLOT (START_MESSAGE_ID, END_MESSAGE_ID);

CREATE INDEX MB_SLOT_QUEUE_INDEX ON MB_SLOT (STORAGE_QUEUE_NAME);

CREATE TABLE MB_SLOT_MESSAGE_ID (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_SLOT_MESSAGE_ID PRIMARY KEY (QUEUE_NAME,MESSAGE_ID)
);

CREATE TABLE MB_NODE_TO_LAST_PUBLISHED_ID (
    NODE_ID VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_LAST_PUBLISHED_ID PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_QUEUE_TO_LAST_ASSIGNED_ID (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_LAST_ASSIGNED_ID PRIMARY KEY (QUEUE_NAME)
);

CREATE TABLE MB_RETAINED_CONTENT (
    MESSAGE_ID NUMERIC(19),
    CONTENT_OFFSET INT,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_RETAINED_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET)
);

CREATE TABLE MB_MSG_STORE_STATUS (
    NODE_ID VARCHAR(512) NOT NULL,
    TIME_STAMP NUMERIC(19),
    CONSTRAINT PK_MSG_STORE_STATUS PRIMARY KEY (NODE_ID, TIME_STAMP) 
);

CREATE TABLE MB_CLUSTER_EVENT (
    EVENT_ID BIGSERIAL,
    ORIGINATED_NODE_ID VARCHAR(512) NOT NULL,
    DESTINED_NODE_ID VARCHAR(512) NOT NULL,
    EVENT_ARTIFACT VARCHAR(25) NOT NULL,
    EVENT_TYPE VARCHAR(25) NOT NULL,
    EVENT_DETAILS VARCHAR(1024) NOT NULL,
    EVENT_DESCRIPTION VARCHAR(1024),
    CONSTRAINT PK_MB_CLUSTER_EVENT PRIMARY KEY (EVENT_ID)
);

CREATE TABLE MB_COORDINATOR_HEARTBEAT (
    ANCHOR INT NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    LAST_HEARTBEAT NUMERIC(19) NOT NULL,
    THRIFT_HOST VARCHAR(512) NOT NULL,
    THRIFT_PORT INT NOT NULL,
    PRIMARY KEY (ANCHOR)
);

CREATE TABLE MB_NODE_HEARTBEAT (
    NODE_ID VARCHAR(512) NOT NULL,
    LAST_HEARTBEAT NUMERIC(19) NOT NULL,
    IS_NEW_NODE NUMERIC(3) NOT NULL,
    CLUSTER_AGENT_HOST VARCHAR(512) NOT NULL,
    CLUSTER_AGENT_PORT INT NOT NULL,
    PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_MEMBERSHIP (
    EVENT_ID BIGSERIAL NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    CHANGE_TYPE NUMERIC(3) NOT NULL,
    CHANGED_MEMBER_ID VARCHAR(512) NOT NULL,
    PRIMARY KEY (EVENT_ID)
);
